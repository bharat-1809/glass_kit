<div align="center">

![Glass Kit](https://raw.githubusercontent.com/bharat-1809/glass_kit/main/display/glass_kit_banner.png)
<br>

A package containing widgets to implement glass morphism in flutter apps

</div><br>

<div align="center">

[![Platform](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev)
[![Pub Package](https://img.shields.io/endpoint?url=https://glass-kit-svg-badge-mlbuzdr853sr.runkit.sh)](https://pub.dev/packages/glass_kit)
[![Build Status](https://img.shields.io/github/workflow/status/bharat-1809/glass_kit/CI?logo=github)](https://github.com/bharat-1809/glass_kit)
[![Codecov Coverage](https://codecov.io/gh/bharat-1809/glass_kit/branch/main/graph/badge.svg?token=N0DFJC64ZA)](https://codecov.io/gh/bharat-1809/glass_kit)
[![License: MIT](https://img.shields.io/github/license/bharat-1809/glass_kit)](https://opensource.org/licenses/MIT)
[![Donate](https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal)](https://www.paypal.me/bsharma1809)

</div><br>

# Table of contents

- [About](#about)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Bugs or Requests](#bugs-or-requests)
- [Contributors](#contributors)
- [License](#license)

# About

GlassMorphism, is a new UI trend with a huge popularity among designers. Glass Kit provides you with widgets and other elements to implement this style in your flutter apps easily and efficiently.<br>

## Gallery:

<br><br>
<img src="https://raw.githubusercontent.com/bharat-1809/glass_kit/main/display/home_theme.png" width=250 alt="ios-themed-glassmorphism"/> &nbsp; &nbsp; &nbsp; &nbsp;
<img src="https://raw.githubusercontent.com/bharat-1809/glass_kit/main/display/card.png" width=250 alt="glassmorphism-in-card"/>
<br>

Source code for the above can be found in the example directory [here](https://github.com/bharat-1809/glass_kit/tree/main/example/lib)

<br>

# Getting Started

You should add the following to the `pubspec.yaml` file:

```yaml
dependencies:
  glass_kit: ^1.0.2
```

You should then run `flutter packages get` in your terminal so as to get the package.<br>

Now import the package in the dart file:

```dart
import 'package:glass_kit/glass_kit.dart';
```

# Usage

To create a basic clear glass container you can use the `clearGlass` constructor. Just provide the `height` and `width` and you are good to go. The `clearGlass` and `frostedGlass` constructors assign default values to the properties if not provided.

```dart
GlassContainer.clearGlass(height: 200, width: 300, child: Child());
```

To create a frosted glass container use the `frostedGlass` constructor.

```dart
GlassContainer.frostedGlass(height: 200, width: 300, child: Child());
```

Depending on your requirements you can tweak with the properties and create awesome glass widgets. You can also use the `GlassContainer` constructor to create fully customizable glass widgets.<br><br>
**__Note :__** GlassContainer comes with properties as in a regular Container but with some exceptions and additions. Checkout the [*docs*](https://pub.dev/documentation/glass_kit/latest/glass_kit/GlassContainer-class.html#instance-properties) for the list of properties and their default values.
<br><br>

Here's a fully customized GlassContainer with shape as circle:

```dart
GlassContainer(
      height: 300,
      width: 400,
      gradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.40), Colors.white.withOpacity(0.10)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.60), Colors.white.withOpacity(0.10), Colors.lightBlueAccent.withOpacity(0.05), Colors.lightBlueAccent.withOpacity(0.6)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 15.0,
      borderWidth: 1.5,
      elevation: 3.0,
      isFrostedGlass: true,
      shadowColor: Colors.black.withOpacity(0.20),
      alignment: Alignment.center,
      frostedOpacity: 0.12,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
    );
```
**__Note :__** You can also provide `borderRadius` but when the shape is `BoxShape.rectangle`.<br>

# Bugs or Requests

If you encounter any problems feel free to open an [issue](https://github.com/bharat-1809/glass_kit/issues/new?assignees=&labels=bug&template=bug_report.md&title=). If you feel the library is missing a feature, please raise a [ticket](https://github.com/bharat-1809/glass_kit/issues/new?assignees=&labels=&template=feature_request.md&title=) on GitHub and I'll look into it. Pull requests are also welcome.

See [Contributing.md](https://github.com/bharat-1809/glass_kit/blob/main/CONTRIBUTING.md).

# Contributors

<!-- TODO: Uncomment this when a contributor is available to add -->
<!-- Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)): -->

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind are welcome! See [Contributing.md](https://github.com/bharat-1809/glass_kit/blob/main/CONTRIBUTING.md).

# License

**glass_kit** is licensed under `MIT License`
