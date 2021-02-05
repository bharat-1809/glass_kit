/// The default values used by the [GlassContainer]

import 'package:flutter/widgets.dart' show Color, BorderRadius;

/// The default value of the Gaussian Blur filter
const double kBlur = 10.0;

/// The constant value of the [borderRadius] property
final BorderRadius kBorderRadius = BorderRadius.circular(0.0);

/// The default value of the [borderWidth]
const double kBorderWidth = 1.0;

/// The default value of the [isFrosted] flag
const bool kIsFrosted = false;

/// The default value of the [frostedOpacity] property
const double kFrostedOpacity = 0.10;

/// The default [elevation] value
const double kElevation = 1.0;

/// The default [shadowColor]
final Color kShadowColor = const Color(0xff000000).withOpacity(0.20);

/// The path of the white-noise image used for frost effect
const String kNoiseImage = 'assets/noise.png';