import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glass_kit/glass_kit.dart';

void main() {
  GlassContainer createColoredBorderGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      borderWidth: 10.0,
    );
  }

  GlassContainer createGradientBorderGlassContainer() {
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

  GlassContainer createColoredBorderCircleGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      shape: BoxShape.circle,
    );
  }

  GlassContainer createGradientBorderCircelGlassContainer() {
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

  GlassContainer createDefaultFrostedGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      isFrostedGlass: true,
    );
  }

  GlassContainer createZeroOpacityFrostedGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      isFrostedGlass: true,
      frostedOpacity: 0.0,
    );
  }

  GlassContainer createRRectGradientBorderGlassContainer() {
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

  GlassContainer createModifiedRRectGlassContainer() {
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

  GlassContainer createModifiedCircleGlassContainer() {
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

  GlassContainer createRectClearGlassContainer() {
    return GlassContainer.clearGlass(height: 200, width: 300);
  }

  GlassContainer createCircleClearGlassContainer() {
    return GlassContainer.clearGlass(
      height: 200,
      width: 300,
      shape: BoxShape.circle,
    );
  }

  GlassContainer createRectFrostedGlassContainer() {
    return GlassContainer.frostedGlass(height: 200, width: 300);
  }

  GlassContainer createCircleFrostedGlassContainer() {
    return GlassContainer.frostedGlass(
      height: 200,
      width: 300,
      shape: BoxShape.circle,
    );
  }

  Widget createGlassContainerWithLayoutProps() {
    final _key = GlobalKey();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: GlassContainer.frostedGlass(
            key: _key,
            height: 200,
            width: 350,
            borderRadius: BorderRadius.circular(24.0),
            alignment: Alignment.bottomRight,
            child: const Text('Glass Kit'),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(8.0),
            transformAlignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(0.10),
          ),
        ),
      ),
    );
  }

  group('GlassContainer Structure Test:', () {
    testWidgets('BackdropFilter with no frost layer is present',
        (WidgetTester tester) async {
      Widget widget = createColoredBorderGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(BackdropFilter), findsOneWidget);
      expect(find.byType(Image), findsNothing);
      expect(find.byType(PhysicalModel), findsOneWidget);
      // 4th Container because there is no frosted layer
      expect(find.byType(Container), findsNWidgets(4));
    });

    testWidgets('Frost layer is present when [isFrosted] is true',
        (WidgetTester tester) async {
      Widget widget = createDefaultFrostedGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(Opacity), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Container), findsNWidgets(3));
    });

    testWidgets('Layout and tranform properties are working fine',
        (WidgetTester tester) async {
      Widget widget = createGlassContainerWithLayoutProps();
      await tester.pumpWidget(widget);

      // one for padding and other for margin
      expect(find.byType(Padding), findsNWidgets(2));
      expect(find.byType(Transform), findsWidgets);
      expect(find.byType(Align), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });
  });

  group('GlassContainer Smoke Test:', () {
    testWidgets('No frosted layer when [frostedOpacity] == 0.0',
        (WidgetTester tester) async {
      Widget widget = createZeroOpacityFrostedGlassContainer();
      await tester.pumpWidget(widget);
      expect(find.byType(Opacity), findsNothing);
      expect(find.byType(Image), findsNothing);
      expect(find.byType(Container), findsNWidgets(4));
    });

    testWidgets('BorderPainters are not used when borderFill is [color]',
        (WidgetTester tester) async {
      Widget widget = createColoredBorderGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsNothing);
      expect(find.byType(ClipRRect), findsOneWidget);

      widget = createGradientBorderGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets(
        'BorderPainters and Clip are working fine incase of [BoxShape.Circle]',
        (WidgetTester tester) async {
      Widget widget = createColoredBorderCircleGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsNothing);
      expect(find.byType(ClipOval), findsOneWidget);

      widget = createGradientBorderCircelGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsOneWidget);
      expect(find.byType(ClipOval), findsOneWidget);
    });
  });

  group('FrostedGlass and ClearGlass Test:', () {
    testWidgets('No frosted layer in clear glass', (WidgetTester tester) async {
      Widget widget = createRectClearGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(Opacity), findsNothing);
      expect(find.byType(Image), findsNothing);

      widget = createCircleClearGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(Opacity), findsNothing);
      expect(find.byType(Image), findsNothing);

      // Since no borderColor specified so border painters will be used
      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('frosted layer is present in frosted glass',
        (WidgetTester tester) async {
      Widget widget = createRectFrostedGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(Opacity), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      widget = createCircleFrostedGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(Opacity), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      // Since no borderColor specified so border painters will be used
      expect(find.byType(CustomPaint), findsOneWidget);
    });
  });

  group('Golden Test:', () {
    testWidgets('Rect with ColoredBorder GlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createColoredBorderGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/rectColoredBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('Rect with GradientBorder GlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createGradientBorderGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/rectGradientBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('Circle with ColoredBorder GlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createColoredBorderCircleGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/circelColoredBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('Circle with GradientBorder GlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createGradientBorderCircelGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/circleGradientBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('RRect with GradientBorder GlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createRRectGradientBorderGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/rRectGradientBorderGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('Modified RRect GlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createModifiedRRectGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/modifiedRRectGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('Modified Circle GlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createModifiedCircleGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/modifiedCircleGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('RectClearGlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createRectClearGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/rectClearGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('CircleClearGlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createCircleClearGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/circleClearGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('RectFrostedGlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createRectFrostedGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/rectFrostedGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('CircleFrostedGlassContainer matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createCircleFrostedGlassContainer();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/circleFrostedGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });

    testWidgets('Layout and Transform props matches goldenfile',
        (WidgetTester tester) async {
      Widget widget = createGlassContainerWithLayoutProps();
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(GlassContainer),
        matchesGoldenFile('golden/layoutGCGoldenImage.png'),
        skip: !Platform.isLinux,
      );
    });
  });
}
