import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glass_kit/glass_kit.dart';

void main() {
  GlassContainer _createColoredBorderGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      borderWidth: 10.0,
    );
  }

  GlassContainer _createGradientBorderGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderGradient: LinearGradient(
        colors: [Colors.lightBlue, Colors.lightBlueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  GlassContainer _createColoredBorderCircleGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      shape: BoxShape.circle,
    );
  }

  GlassContainer _createGradientBorderCircelGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      shape: BoxShape.circle,
      borderGradient: LinearGradient(
        colors: [Colors.lightBlue, Colors.lightBlueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  GlassContainer _createDefaultFrostedGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      isFrostedGlass: true,
    );
  }

  GlassContainer _createZeroOpacityFrostedGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      isFrostedGlass: true,
      frostedOpacity: 0.0,
    );
  }

  GlassContainer _createRRectGradientBorderGlassContainer() {
    return GlassContainer(
      height: 200,
      width: 350,
      color: Colors.white.withOpacity(0.60),
      borderRadius: BorderRadius.circular(24.0),
      borderWidth: 10.0,
      borderGradient: LinearGradient(
        colors: [Colors.lightBlue, Colors.lightBlueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  GlassContainer _createModifiedRRectGlassContainer() {
    return GlassContainer(
      height: 200,
      width: 350,
      gradient: LinearGradient(
        colors: [
          Colors.lightGreen.withOpacity(0.40),
          Colors.lightGreen.withOpacity(0.10),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.lightBlue.withOpacity(0.60),
          Colors.lightBlue.withOpacity(0.10),
          Colors.lightBlueAccent.withOpacity(0.05),
          Colors.lightBlueAccent.withOpacity(0.60),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 20,
      borderRadius: BorderRadius.circular(24.0),
      borderWidth: 1.5,
      elevation: 3.0,
      isFrostedGlass: true,
      shadowColor: Colors.lightGreenAccent.withOpacity(0.20),
    );
  }

  GlassContainer _createModifiedCircleGlassContainer() {
    return GlassContainer(
      height: 325,
      width: 400,
      gradient: LinearGradient(
        colors: [
          Colors.lightGreen.withOpacity(0.40),
          Colors.lightGreen.withOpacity(0.10),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.lightBlue.withOpacity(0.60),
          Colors.lightBlue.withOpacity(0.10),
          Colors.lightBlueAccent.withOpacity(0.05),
          Colors.lightBlueAccent.withOpacity(0.60),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 20,
      shape: BoxShape.circle,
      borderWidth: 1.5,
      elevation: 3.0,
      isFrostedGlass: true,
      shadowColor: Colors.lightGreenAccent.withOpacity(0.20),
    );
  }

  group('GlassContainer Structure Test:', () {
    testWidgets('BackdropFilter with no frost layer is present',
        (WidgetTester tester) async {
      Widget widget = _createColoredBorderGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(BackdropFilter), findsOneWidget);
      expect(find.byType(Image), findsNothing);
      expect(find.byType(PhysicalModel), findsOneWidget);
      // 4th Container because there is no frosted layer
      expect(find.byType(Container), findsNWidgets(4));
    });

    testWidgets('Frost layer is present when [isFrosted] is true',
        (WidgetTester tester) async {
      Widget widget = _createDefaultFrostedGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(Opacity), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Container), findsNWidgets(3));
    });
  });

  group('GlassContainer Smoke Test:', () {
    testWidgets('No frosted layer when [frostedOpacity] == 0.0',
        (WidgetTester tester) async {
      Widget widget = _createZeroOpacityFrostedGlassContainer();
      await tester.pumpWidget(widget);
      expect(find.byType(Opacity), findsNothing);
      expect(find.byType(Image), findsNothing);
      expect(find.byType(Container), findsNWidgets(4));
    });

    testWidgets('BorderPainters are not used when borderFill is [color]',
        (WidgetTester tester) async {
      Widget widget = _createColoredBorderGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsNothing);
      expect(find.byType(ClipRRect), findsOneWidget);

      widget = _createGradientBorderGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets(
        'BorderPainters and Clip are working fine incase of [BoxShape.Circle]',
        (WidgetTester tester) async {
      Widget widget = _createColoredBorderCircleGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsNothing);
      expect(find.byType(ClipOval), findsOneWidget);

      widget = _createGradientBorderCircelGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsOneWidget);
      expect(find.byType(ClipOval), findsOneWidget);
    });
  });

  group('Golden Test:', () {
    testWidgets(
        'Rect with ColoredBorder GlassContainer matches goldenfile image',
        (WidgetTester tester) async {
      Widget widget = _createColoredBorderGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/rectColoredBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets(
        'Rect with GradientBorder GlassContainer matches goldenfile image',
        (WidgetTester tester) async {
      Widget widget = _createGradientBorderGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/rectGradientBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets(
        'Circle with ColoredBorder GlassContainer matches goldenfile image',
        (WidgetTester tester) async {
      Widget widget = _createColoredBorderCircleGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/circelColoredBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets(
        'Circle with GradientBorder GlassContainer matches goldenfile image',
        (WidgetTester tester) async {
      Widget widget = _createGradientBorderCircelGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/circleGradientBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets(
        'RRect with GradientBorder GlassContainer matches goldenfile image',
        (WidgetTester tester) async {
      Widget widget = _createRRectGradientBorderGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/rRectGradientBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('Modified RRect GlassContainer matches goldenfile image',
        (WidgetTester tester) async {
      Widget widget = _createModifiedRRectGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/modifiedRRectGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('Modified Circle GlassContainer matches goldenfile image',
        (WidgetTester tester) async {
      Widget widget = _createModifiedCircleGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/modifiedCircleGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });
  });
}
