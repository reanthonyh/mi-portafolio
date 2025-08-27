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
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 40))
      ..repeat(reverse: true);
    _loadShader();
  }

  Future<void> _loadShader() async {
    final program = await ui.FragmentProgram.fromAsset('shaders/minimal_background.frag');
    setState(() {
      _shader = program.fragmentShader();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_shader == null) {
      return ColoredBox(color: widget.backgroundColor);
    }

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _ShaderPainter(
              shader: _shader!,
              time: _controller.value * 60, // Multiplicamos para que el tiempo avance
              backgroundColor: widget.backgroundColor,
              shapesColor: widget.shapesColor,
            ),
            child: const SizedBox(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

    shader.setFloat(3, backgroundColor.r);
    shader.setFloat(4, backgroundColor.g);
    shader.setFloat(5, backgroundColor.b);

    shader.setFloat(6, shapesColor.r);
    shader.setFloat(7, shapesColor.g);
    shader.setFloat(8, shapesColor.b);

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
