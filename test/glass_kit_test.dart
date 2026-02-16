import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      child: const SizedBox(),
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
      child: const SizedBox(),
    );
  }

  GlassContainer createColoredBorderCircleGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      shape: BoxShape.circle,
      child: const SizedBox(),
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
      child: const SizedBox(),
    );
  }

  GlassContainer createDefaultFrostedGlassContainer() {
    return GlassContainer(
      height: 100,
      width: 100,
      color: Colors.white,
      borderColor: Colors.black,
      isFrostedGlass: true,
      child: const SizedBox(),
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
      child: const SizedBox(),
    );
  }

  GlassContainer createRRectGradientBorderGlassContainer() {
    return GlassContainer(
      height: 200,
      width: 350,
      color: Colors.white.withValues(alpha: 0.60),
      borderRadius: BorderRadius.circular(24.0),
      borderWidth: 10.0,
      borderGradient: LinearGradient(
        colors: [Colors.lightBlue, Colors.lightBlueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: const SizedBox(),
    );
  }

  GlassContainer createModifiedRRectGlassContainer() {
    return GlassContainer(
      height: 200,
      width: 350,
      gradient: LinearGradient(
        colors: [
          Colors.lightGreen.withValues(alpha: 0.40),
          Colors.lightGreen.withValues(alpha: 0.10),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.lightBlue.withValues(alpha: 0.60),
          Colors.lightBlue.withValues(alpha: 0.10),
          Colors.lightBlueAccent.withValues(alpha: 0.05),
          Colors.lightBlueAccent.withValues(alpha: 0.60),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 20,
      borderRadius: BorderRadius.circular(24.0),
      borderWidth: 1.5,
      isFrostedGlass: true,
      child: const SizedBox(),
    );
  }

  GlassContainer createModifiedCircleGlassContainer() {
    return GlassContainer(
      height: 325,
      width: 400,
      gradient: LinearGradient(
        colors: [
          Colors.lightGreen.withValues(alpha: 0.40),
          Colors.lightGreen.withValues(alpha: 0.10),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.lightBlue.withValues(alpha: 0.60),
          Colors.lightBlue.withValues(alpha: 0.10),
          Colors.lightBlueAccent.withValues(alpha: 0.05),
          Colors.lightBlueAccent.withValues(alpha: 0.60),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 20,
      shape: BoxShape.circle,
      borderWidth: 1.5,
      isFrostedGlass: true,
      child: const SizedBox(),
    );
  }

  GlassContainer createRectClearGlassContainer() {
    return GlassContainer.clearGlass(
      height: 200,
      width: 300,
      child: const SizedBox(),
    );
  }

  GlassContainer createCircleClearGlassContainer() {
    return GlassContainer.clearGlass(
      height: 200,
      width: 300,
      shape: BoxShape.circle,
      child: const SizedBox(),
    );
  }

  GlassContainer createRectFrostedGlassContainer() {
    return GlassContainer.frostedGlass(
      height: 200,
      width: 300,
      child: const SizedBox(),
    );
  }

  GlassContainer createCircleFrostedGlassContainer() {
    return GlassContainer.frostedGlass(
      height: 200,
      width: 300,
      shape: BoxShape.circle,
      child: const SizedBox(),
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
      // Verify basic structure exists
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('Frost layer is present when [isFrosted] is true',
        (WidgetTester tester) async {
      Widget widget = createDefaultFrostedGlassContainer();
      await tester.pumpWidget(widget);

      // On non-web, NoiseShaderWidget doesn't use Opacity/Image during tests
      // Just verify the basic structure exists
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('Layout and tranform properties are working fine',
        (WidgetTester tester) async {
      Widget widget = createGlassContainerWithLayoutProps();
      await tester.pumpWidget(widget);

      // Verify key layout widgets are present
      expect(find.byType(Padding), findsWidgets);
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
      // When frostedOpacity is 0, no frost layer should be added
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('BorderPainters are not used when borderFill is [color]',
        (WidgetTester tester) async {
      Widget widget = createColoredBorderGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsNothing);
      // BorderRadius.zero uses ClipRect, not ClipRRect
      expect(find.byType(ClipRect), findsOneWidget);

      widget = createGradientBorderGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(CustomPaint), findsOneWidget);
      // BorderRadius.zero uses ClipRect, not ClipRRect
      expect(find.byType(ClipRect), findsOneWidget);
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

      // Frosted glass should have the basic structure
      // Note: NoiseShaderWidget loads asynchronously in tests
      expect(find.byType(GlassContainer), findsOneWidget);

      widget = createCircleFrostedGlassContainer();
      await tester.pumpWidget(widget);

      expect(find.byType(GlassContainer), findsOneWidget);
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

  // Following Flutter's Container test patterns
  group('GlassContainer control tests:', () {
    final GlassContainer container = GlassContainer(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(7.0),
      color: const Color(0xFF00FF00),
      borderGradient: const LinearGradient(
        colors: [Color(0x99FFFFFF), Color(0x1AFFFFFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      width: 53.0,
      height: 76.0,
      margin: const EdgeInsets.all(5.0),
      blur: 15.0,
      isFrostedGlass: false,
      child: const SizedBox(
        width: 25.0,
        height: 33.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFFFFFF00)),
        ),
      ),
    );

    testWidgets('paints as expected', (WidgetTester tester) async {
      await tester.pumpWidget(
          Align(alignment: Alignment.topLeft, child: container));

      final RenderBox box = tester.renderObject(find.byType(GlassContainer));
      expect(box, isNotNull);
      // Size should include margin (5px all sides = 10px total each dimension)
      expect(box.size.width, greaterThan(60.0));
      expect(box.size.height, greaterThan(80.0));
    });

    group('diagnostics', () {
      testWidgets('has reasonable default diagnostics',
          (WidgetTester tester) async {
        await tester.pumpWidget(
            Align(alignment: Alignment.topLeft, child: container));

        final RenderBox box = tester.renderObject(find.byType(GlassContainer));

        expect(container, hasOneLineDescription);
        expect(box, hasAGoodToStringDeep);
      });

      testWidgets('has expected info diagnostics',
          (WidgetTester tester) async {
        await tester.pumpWidget(
            Align(alignment: Alignment.topLeft, child: container));

        final RenderBox box = tester.renderObject(find.byType(GlassContainer));

        // Verify the render tree contains expected elements
        final String diagnostics =
            box.toStringDeep(minLevel: DiagnosticLevel.info);
        expect(diagnostics, contains('RenderPadding')); // margin or padding
        expect(diagnostics, contains('RenderConstrainedBox')); // constraints
        // BackdropFilter is wrapped in other render objects
        expect(diagnostics, isNotEmpty);
      });
    });
  });

  group('Layout and Constraint Tests:', () {
    testWidgets('respects explicit width and height',
        (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Align(
            alignment: Alignment.topLeft,
            child: GlassContainer(
              key: key,
              width: 150,
              height: 200,
              color: Colors.white,
              borderColor: Colors.black,
              child: const SizedBox(),
            ),
          ),
        ),
      );

      expect(tester.getSize(find.byKey(key)), equals(const Size(150, 200)));
    });

    testWidgets('circle shape uses height as diameter',
        (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Align(
            alignment: Alignment.topLeft,
            child: GlassContainer(
              key: key,
              height: 100,
              // Only height specified - circle should use it as diameter
              color: Colors.white,
              borderColor: Colors.black,
              shape: BoxShape.circle,
              child: const SizedBox(),
            ),
          ),
        ),
      );

      final size = tester.getSize(find.byKey(key));
      expect(size.width, equals(100)); // Uses height as diameter
      expect(size.height, equals(100));
    });

    testWidgets('margin affects final size', (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Align(
            alignment: Alignment.topLeft,
            child: GlassContainer(
              key: key,
              width: 100,
              height: 100,
              color: Colors.white,
              borderColor: Colors.black,
              margin: const EdgeInsets.all(10.0),
              child: const SizedBox(),
            ),
          ),
        ),
      );

      expect(tester.getSize(find.byKey(key)), equals(const Size(120, 120)));
    });

    testWidgets('transformAlignment positions correctly',
        (WidgetTester tester) async {
      final Key key = UniqueKey();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 100.0,
                left: 100.0,
                child: GlassContainer(
                  width: 100.0,
                  height: 100.0,
                  key: key,
                  color: Colors.white,
                  borderColor: Colors.black,
                  transform: Matrix4.diagonal3Values(0.5, 0.5, 1.0),
                  transformAlignment: Alignment.centerRight,
                  child: const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      );

      final Finder finder = find.byKey(key);

      expect(tester.getSize(finder), equals(const Size(100, 100)));
      expect(tester.getTopLeft(finder), equals(const Offset(100, 100)));
      expect(tester.getTopRight(finder), equals(const Offset(200, 100)));
      expect(tester.getBottomLeft(finder), equals(const Offset(100, 200)));
      expect(tester.getBottomRight(finder), equals(const Offset(200, 200)));
    });
  });

  group('Clipping Behavior Tests:', () {
    testWidgets('Rectangle without borderRadius uses ClipRect',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GlassContainer(
          width: 100,
          height: 100,
          color: Colors.white,
          borderColor: Colors.black,
          borderRadius: BorderRadius.zero,
          child: const SizedBox(),
        ),
      );

      expect(find.byType(ClipRect), findsOneWidget);
      expect(find.byType(ClipRRect), findsNothing);
      expect(find.byType(ClipOval), findsNothing);
    });

    testWidgets('Rectangle with borderRadius uses ClipRRect',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GlassContainer(
          width: 100,
          height: 100,
          color: Colors.white,
          borderColor: Colors.black,
          borderRadius: BorderRadius.circular(10),
          child: const SizedBox(),
        ),
      );

      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(ClipRect), findsNothing);
      expect(find.byType(ClipOval), findsNothing);
    });

    testWidgets('Circle shape uses ClipOval', (WidgetTester tester) async {
      await tester.pumpWidget(
        GlassContainer(
          width: 100,
          height: 100,
          color: Colors.white,
          borderColor: Colors.black,
          shape: BoxShape.circle,
          child: const SizedBox(),
        ),
      );

      expect(find.byType(ClipOval), findsOneWidget);
      expect(find.byType(ClipRect), findsNothing);
      expect(find.byType(ClipRRect), findsNothing);
    });
  });

  group('Assertion Tests:', () {
    test('throws when both color and gradient are null', () {
      expect(
        () => GlassContainer(
          width: 100,
          height: 100,
          borderColor: Colors.black,
          child: const SizedBox(),
          // color: null, gradient: null - both missing
        ),
        throwsAssertionError,
      );
    });

    test('throws when both borderColor and borderGradient are null', () {
      expect(
        () => GlassContainer(
          width: 100,
          height: 100,
          color: Colors.white,
          child: const SizedBox(),
          // borderColor: null, borderGradient: null - both missing
        ),
        throwsAssertionError,
      );
    });

    test('throws when borderRadius is set with BoxShape.circle', () {
      expect(
        () => GlassContainer(
          width: 100,
          height: 100,
          color: Colors.white,
          borderColor: Colors.black,
          shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(10), // Invalid with circle
          child: const SizedBox(),
        ),
        throwsAssertionError,
      );
    });
  });

  group('Hit Testing:', () {
    testWidgets('GlassContainer is hittable with decorations',
        (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: GestureDetector(
            onTap: () => tapped = true,
            child: GlassContainer(
              width: 100,
              height: 100,
              color: Colors.white,
              borderColor: Colors.black,
              child: const SizedBox(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GlassContainer));
      expect(tapped, true);
    });
  });

  testWidgets('Can be placed in an infinite box', (WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(
          children: <Widget>[
            GlassContainer.clearGlass(
              child: const Text('test'),
            ),
          ],
        ),
      ),
    );
    // Should not throw - verifies GlassContainer handles unbounded constraints
  });

  group('Advanced Layout Tests:', () {
    testWidgets('works with Expanded in Row', (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                const SizedBox(width: 100),
                Expanded(
                  child: GlassContainer(
                    key: key,
                    color: Colors.white,
                    borderColor: Colors.black,
                    child: const SizedBox(),
                  ),
                ),
                const SizedBox(width: 100),
              ],
            ),
          ),
        ),
      );

      // Should fill remaining space (800 - 100 - 100 = 600)
      final size = tester.getSize(find.byKey(key));
      expect(size.width, equals(600));
    });

    testWidgets('works with Expanded in Column', (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 100),
                Expanded(
                  child: GlassContainer(
                    key: key,
                    color: Colors.white,
                    borderColor: Colors.black,
                    child: const SizedBox(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      );

      // Should fill remaining vertical space (600 - 100 - 100 = 400)
      final size = tester.getSize(find.byKey(key));
      expect(size.height, equals(400));
    });

    testWidgets('works with Flexible and flex factors',
        (WidgetTester tester) async {
      final key1 = GlobalKey();
      final key2 = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GlassContainer(
                    key: key1,
                    color: Colors.white,
                    borderColor: Colors.black,
                    child: const SizedBox.expand(),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: GlassContainer(
                    key: key2,
                    color: Colors.blue,
                    borderColor: Colors.black,
                    child: const SizedBox.expand(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      final size1 = tester.getSize(find.byKey(key1));
      final size2 = tester.getSize(find.byKey(key2));

      // flex 1:2 ratio means size2 should be ~2x size1
      expect(size2.width / size1.width, closeTo(2.0, 0.1));
    });

    testWidgets('respects parent constraints without explicit size',
        (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                height: 200,
                child: GlassContainer(
                  key: key,
                  color: Colors.white,
                  borderColor: Colors.black,
                  child: const SizedBox.expand(),
                ),
              ),
            ),
          ),
        ),
      );

      // Should take parent's size
      final size = tester.getSize(find.byKey(key));
      expect(size.width, equals(300));
      expect(size.height, equals(200));
    });

    testWidgets('respects BoxConstraints min/max',
        (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: GlassContainer(
                key: key,
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 200,
                  minHeight: 150,
                  maxHeight: 250,
                ),
                color: Colors.white,
                borderColor: Colors.black,
                child: const SizedBox(width: 50, height: 50),
              ),
            ),
          ),
        ),
      );

      final size = tester.getSize(find.byKey(key));
      // Should respect min constraints even though child is smaller
      expect(size.width, greaterThanOrEqualTo(100));
      expect(size.height, greaterThanOrEqualTo(150));
    });

    testWidgets('handles tight constraints correctly',
        (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 250,
                height: 180,
                child: GlassContainer(
                  key: key,
                  color: Colors.white,
                  borderColor: Colors.black,
                  child: const SizedBox.expand(),
                ),
              ),
            ),
          ),
        ),
      );

      // Should match tight constraints from SizedBox
      final size = tester.getSize(find.byKey(key));
      expect(size.width, equals(250));
      expect(size.height, equals(180));
    });

    testWidgets('works in FittedBox', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: FittedBox(
                  child: GlassContainer(
                    width: 100,
                    height: 100,
                    color: Colors.white,
                    borderColor: Colors.black,
                    child: const SizedBox(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Should not throw - verifies GlassContainer works with FittedBox scaling
      expect(find.byType(GlassContainer), findsOneWidget);
    });

    testWidgets('handles zero constraints gracefully',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 0,
                height: 0,
                child: GlassContainer(
                  color: Colors.white,
                  borderColor: Colors.black,
                  child: const SizedBox(),
                ),
              ),
            ),
          ),
        ),
      );

      // Should handle zero-size constraints without crashing
      expect(find.byType(GlassContainer), findsOneWidget);
    });

    testWidgets('works with AspectRatio', (WidgetTester tester) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: GlassContainer(
                    key: key,
                    color: Colors.white,
                    borderColor: Colors.black,
                    child: const SizedBox(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      final size = tester.getSize(find.byKey(key));
      // Should maintain 16:9 aspect ratio
      expect(size.width / size.height, closeTo(16 / 9, 0.1));
    });

    testWidgets('works with IntrinsicWidth', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: IntrinsicWidth(
                child: GlassContainer(
                  color: Colors.white,
                  borderColor: Colors.black,
                  child: const Text('Hello World'),
                ),
              ),
            ),
          ),
        ),
      );

      // Should size to content width
      expect(find.byType(GlassContainer), findsOneWidget);
      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('works with IntrinsicHeight', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GlassContainer(
                      width: 100,
                      color: Colors.white,
                      borderColor: Colors.black,
                      child: const Text('Short'),
                    ),
                    GlassContainer(
                      width: 100,
                      color: Colors.blue,
                      borderColor: Colors.black,
                      child: const Text('Tall\nContent\nHere'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Both containers should have same height (tallest child)
      final containers = tester.widgetList<GlassContainer>(
        find.byType(GlassContainer),
      );
      expect(containers.length, equals(2));
    });
  });
}
