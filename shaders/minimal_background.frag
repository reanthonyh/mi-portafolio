#version 460
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float uTime;
uniform vec3 uBackgroundColor;
uniform vec3 uShapesColor;

// Función de ruido pseudo-aleatorio para generar las formas
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

// Función para generar ruido de valor suave (Value Noise)
float noise(vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

out vec4 fragColor;

void main() {
    vec2 st = FlutterFragCoord().xy / uSize.xy;
    st.x *= uSize.x / uSize.y;

    // Movimiento orgánico usando el tiempo
    float t = uTime * 0.1;

    // Generar varias capas de ruido con diferentes escalas y movimientos
    float n = 0.0;
    n += noise(st * 2.0 + t * 0.2) * 0.5;
    n += noise(st * 4.0 - t * 0.3) * 0.25;
    n += noise(st * 8.0 + t * 0.15) * 0.125;

    // Suavizar el resultado final
    n = smoothstep(0.4, 0.6, n);

    // Mezclar el color de fondo con el color de las formas basado en el ruido
    vec3 color = mix(uBackgroundColor, uShapesColor, n);

    fragColor = vec4(color, 1.0);
}
