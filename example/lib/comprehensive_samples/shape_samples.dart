import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'sample_home.dart';

/// Shape Tests
/// Tests all shape and clipping variations for GlassContainer
class ShapeSamplesPage extends StatelessWidget {
  const ShapeSamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SamplePageScaffold(
      title: 'Shapes',
      subtitle: '12 samples • Rectangle, circle, clipping',
      children: [
        // ============================================
        // RECTANGLE SHAPES
        // ============================================
        const SampleSection('Rectangle Variations'),

        SampleCaseWidget(SampleCase(
          id: 'SHP-001',
          title: 'Default rectangle',
          description: 'Standard rectangle with default borderRadius',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 70,
            width: 200,
            child: const Center(
              child: Text('Default', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-002',
          title: 'Zero borderRadius (sharp)',
          description: 'Rectangle with no corner rounding',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 70,
            width: 200,
            borderRadius: BorderRadius.zero,
            child: const Center(
              child:
                  Text('Sharp Corners', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-003',
          title: 'Small borderRadius (4)',
          description: 'Subtle corner rounding',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 70,
            width: 200,
            borderRadius: BorderRadius.circular(4),
            child: const Center(
              child: Text('Radius: 4', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-004',
          title: 'Medium borderRadius (16)',
          description: 'Standard corner rounding',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 70,
            width: 200,
            borderRadius: BorderRadius.circular(16),
            child: const Center(
              child: Text('Radius: 16', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-005',
          title: 'Asymmetric borderRadius',
          description: 'Different radius per corner',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: 200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(32),
            ),
            child: const Center(
              child: Text('Asymmetric', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-006',
          title: 'Top corners only',
          description: 'Rounded top, sharp bottom',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: 200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: const Center(
              child: Text('Top Only', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        // ============================================
        // CIRCLE SHAPES
        // ============================================
        const SampleSection('Circle Variations'),

        SampleCaseWidget(SampleCase(
          id: 'SHP-007',
          title: 'Circle with height only',
          description: 'Height defines diameter, width inferred',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 100,
              shape: BoxShape.circle,
              child: const Center(
                child: Text('100', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-008',
          title: 'Circle - small (40)',
          description: 'Small circular glass',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 40,
              shape: BoxShape.circle,
              child: const Center(
                child: Icon(Icons.star, color: Colors.white, size: 16),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-009',
          title: 'Circle - medium (80)',
          description: 'Medium circular glass',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 80,
              shape: BoxShape.circle,
              child: const Center(
                child: Icon(Icons.person, color: Colors.white, size: 32),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-010',
          title: 'Circle - large (120)',
          description: 'Large circular glass',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 120,
              shape: BoxShape.circle,
              child: const Center(
                child: Icon(Icons.favorite, color: Colors.red, size: 48),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-011',
          title: 'Circle in Row',
          description: 'Multiple circles in horizontal layout',
          status: SampleStatus.passing,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GlassContainer.clearGlass(
                height: 60,
                shape: BoxShape.circle,
                child:
                    const Center(child: Icon(Icons.home, color: Colors.white)),
              ),
              GlassContainer.clearGlass(
                height: 60,
                shape: BoxShape.circle,
                child: const Center(
                    child: Icon(Icons.search, color: Colors.white)),
              ),
              GlassContainer.clearGlass(
                height: 60,
                shape: BoxShape.circle,
                child: const Center(
                    child: Icon(Icons.settings, color: Colors.white)),
              ),
            ],
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SHP-012',
          title: 'Frosted circle',
          description: 'Circle with frosted glass effect',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.frostedGlass(
              height: 100,
              shape: BoxShape.circle,
              child: const Center(
                child: Text('Frost', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        const SizedBox(height: 32),
      ],
    );
  }
}
