import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class AnimatedShaderBackground extends StatefulWidget {
  final Color backgroundColor;
  final Color shapesColor;

  const AnimatedShaderBackground({
    super.key,
    required this.backgroundColor,
    required this.shapesColor,
  });

  @override
  State<AnimatedShaderBackground> createState() => _AnimatedShaderBackgroundState();
}

class _AnimatedShaderBackgroundState extends State<AnimatedShaderBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  ui.FragmentShader? _shader;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 20))
      ..repeat();
    _loadShader();
  }

  Future<void> _loadShader() async {
    final program = await ui.FragmentProgram.fromAsset('shaders/minimal_background.frag');
    setState(() {
      _shader = program.fragmentShader();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_shader == null) {
      return Container(color: widget.backgroundColor);
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ShaderPainter(
            shader: _shader!,
            time: _controller.value * 20, // Multiplicamos para que el tiempo avance
            backgroundColor: widget.backgroundColor,
            shapesColor: widget.shapesColor,
          ),
          child: const SizedBox(),
        );
      },
    );
  }
}

class _ShaderPainter extends CustomPainter {
  final ui.FragmentShader shader;
  final double time;
  final Color backgroundColor;
  final Color shapesColor;

  _ShaderPainter({
    required this.shader,
    required this.time,
    required this.backgroundColor,
    required this.shapesColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);

    // Convertir colores a un formato que el shader entienda (vec3 de 0.0 a 1.0)
    shader.setFloat(3, backgroundColor.red / 255.0);
    shader.setFloat(4, backgroundColor.green / 255.0);
    shader.setFloat(5, backgroundColor.blue / 255.0);

    shader.setFloat(6, shapesColor.red / 255.0);
    shader.setFloat(7, shapesColor.green / 255.0);
    shader.setFloat(8, shapesColor.blue / 255.0);

    final paint = Paint()..shader = shader;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant _ShaderPainter oldDelegate) {
    return time != oldDelegate.time ||
        shader != oldDelegate.shader ||
        backgroundColor != oldDelegate.backgroundColor ||
        shapesColor != oldDelegate.shapesColor;
  }
}
