#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

// Uniforms passed from Dart (Flutter automatically handles these in order)
uniform vec2 uSize;    // Screen/widget resolution (equivalent to iResolution.xy)
uniform float scale;   // Controls noise block size (original default: 1.0)
uniform float opacity; // Controls noise opacity (0.0 to 1.0)

// Hash function for noise generation
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Scale the coordinates
    vec2 scaledCoord = floor(fragCoord / scale);

    // Generate noise based on scaled coordinates
    float noise = hash(scaledCoord);

    // Output noise with premultiplied alpha for proper blending
    // RGB is the noise value, alpha controls visibility
    fragColor = vec4(vec3(noise) * opacity, opacity);
}

void main() {
    mainImage(fragColor, FlutterFragCoord().xy);
}
