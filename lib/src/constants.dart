/// The default values used by the [GlassContainer]

import 'package:flutter/widgets.dart'
    show Color, BorderRadius, BlendMode, LinearGradient, Alignment;

/// The default value of the Gaussian Blur filter
const double kBlur = 12.0;

/// The constant value of the [borderRadius] property
const BorderRadius kBorderRadius = BorderRadius.zero;

/// The default value of the [borderWidth]
const double kBorderWidth = 1.0;

/// The default value of the [isFrosted] flag
const bool kIsFrosted = false;

/// The default value of the [frostedOpacity] property
const double kFrostedOpacity = 0.10;

/// The default [elevation] value
const double kElevation = 1.0;

/// The default [shadowColor]: Black with 20% opacity
const Color kShadowColor = Color(0x33000000);

/// The path of the white-noise image used for frost effect
const String kNoiseImage = 'assets/noise.png';

/// Blend Color for frosted layer
const Color kFrostBlendColor = Color(0xFFFFFFFF);

/// Blend mode for frosted layer
const BlendMode kFrostBlendMode = BlendMode.difference;

/// Default gradient fill of the containers
const LinearGradient kGradientFill = LinearGradient(
  colors: [Color(0x66FFFFFF), Color(0x1AFFFFFF)],
  begin: Alignment.topLeft,
  end: Alignment(0.80, 0.80),
);

/// Default border gradient fill of the containers
const LinearGradient kBorderGradientFill = LinearGradient(
  colors: [
    Color(0x99FFFFFF),
    Color(0x1AFFFFFF),
    Color(0x1AF0FFFF),
    Color(0x99F0FFFF)
  ],
  begin: Alignment(0.2, 0.0),
  end: Alignment(1.0, 1.0),
  stops: [0.0, 0.39, 0.40, 1.0],
);
