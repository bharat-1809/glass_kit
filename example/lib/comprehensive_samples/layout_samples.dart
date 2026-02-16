import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'sample_home.dart';

/// Layout & Sizing Samples
/// Samples all dimension and constraint variations for GlassContainer
class LayoutSamplesPage extends StatelessWidget {
  const LayoutSamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SamplePageScaffold(
      title: 'Layout & Sizing',
      subtitle: '16 samples • Dimensions, constraints, sizing behavior',
      children: [
        // ============================================
        // FIXED DIMENSIONS
        // ============================================
        const SampleSection('Fixed Dimensions'),

        SampleCaseWidget(SampleCase(
          id: 'LAY-001',
          title: 'Both height & width explicit',
          description: 'Classic usage with both dimensions specified',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: 200,
            child: const Center(
              child: Text('80 × 200', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-002',
          title: 'width: double.infinity',
          description: 'Full width with fixed height',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 60,
            width: double.infinity,
            child: const Center(
              child: Text('height: 60, width: ∞',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-003',
          title: 'Small dimensions',
          description: 'Minimum viable size (24×24)',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 24,
              width: 24,
              child: const Center(
                child: Icon(Icons.star, color: Colors.white, size: 12),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-004',
          title: 'Large dimensions',
          description: 'Large container (300×150)',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 150,
            width: 300,
            child: const Center(
              child: Text('300 × 150',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        )),

        // ============================================
        // PARTIAL DIMENSIONS
        // ============================================
        const SampleSection('Partial Dimensions'),

        SampleCaseWidget(SampleCase(
          id: 'LAY-005',
          title: 'Width only (content wraps height)',
          description: 'No height specified - wraps to content',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            width: 280,
            padding: const EdgeInsets.all(16),
            child: const Text(
              'No height specified!\nThis text determines the height.\nThird line here.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-006',
          title: 'Height only (takes available width)',
          description: 'No width specified - expands in ListView',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 60,
            child: const Center(
              child: Text('height: 60, no width',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-007',
          title: 'Multi-line content height adaptation',
          description: 'Width fixed, height grows with content',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            width: 250,
            padding: const EdgeInsets.all(12),
            child: const Text(
              'Line 1 of the content\n'
              'Line 2 continues here\n'
              'Line 3 is the third line\n'
              'Line 4 wraps nicely\n'
              'Line 5 is the last',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )),

        // ============================================
        // NO DIMENSIONS
        // ============================================
        const SampleSection('No Dimensions'),

        SampleCaseWidget(SampleCase(
          id: 'LAY-008',
          title: 'Pure content wrapping - single line',
          description: 'No dimensions, content determines size',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Text('Tag Label',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-009',
          title: 'Pure content wrapping - multi-line',
          description: 'No dimensions with multi-line content',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              padding: const EdgeInsets.all(16),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Line 1', style: TextStyle(color: Colors.white)),
                  Text('Longer Line 2', style: TextStyle(color: Colors.white)),
                  Text('Line 3', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-010',
          title: 'With icon and text (Row)',
          description: 'Complex child with icon',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite, color: Colors.red, size: 18),
                  SizedBox(width: 8),
                  Text('Liked', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        )),

        // ============================================
        // CONSTRAINT VARIATIONS
        // ============================================
        const SampleSection('Constraint Variations'),

        SampleCaseWidget(SampleCase(
          id: 'LAY-011',
          title: 'minWidth / maxWidth',
          description: 'Constrained width range (100-200)',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
              padding: const EdgeInsets.all(12),
              child: const Text('Min 100, Max 200',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-012',
          title: 'minHeight / maxHeight',
          description: 'Constrained height range (50-100)',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            width: 200,
            constraints: const BoxConstraints(minHeight: 50, maxHeight: 100),
            padding: const EdgeInsets.all(12),
            child: const Text('Min H 50, Max H 100',
                style: TextStyle(color: Colors.white)),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-013',
          title: 'BoxConstraints.expand()',
          description: 'Fills available space (in constrained parent)',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 100,
            width: double.infinity,
            child: GlassContainer.clearGlass(
              constraints: const BoxConstraints.expand(),
              child: const Center(
                child: Text('Expanded to fill',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-014',
          title: 'BoxConstraints.loose()',
          description: 'Up to 150×80, content determines actual size',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              constraints: BoxConstraints.loose(const Size(150, 80)),
              padding: const EdgeInsets.all(12),
              child: const Text('Loose', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-015',
          title: 'Tight width, flexible height',
          description: 'Width=200, height from content',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              constraints: const BoxConstraints.tightFor(width: 200),
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Tight width (200)\nFlexible height',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'LAY-016',
          title: 'Combined constraints with dimensions',
          description: 'height + constraints together',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 70,
            constraints: const BoxConstraints(minWidth: 150, maxWidth: 250),
            padding: const EdgeInsets.all(12),
            child: const Center(
              child: Text('H=70, W=150-250',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        const SizedBox(height: 32),
      ],
    );
  }
}
