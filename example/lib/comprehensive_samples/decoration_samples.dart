import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'sample_home.dart';

/// Decoration Tests
/// Tests all visual decoration properties for GlassContainer
class DecorationSamplesPage extends StatelessWidget {
  const DecorationSamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SamplePageScaffold(
      title: 'Decoration',
      subtitle: '20 samples • Gradients, colors, borders, shadows, spacing',
      children: [
        // ============================================
        // GRADIENTS
        // ============================================
        const SampleSection('Gradients'),

        SampleCaseWidget(SampleCase(
          id: 'DEC-001',
          title: 'LinearGradient - horizontal',
          description: 'Left to right gradient',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            gradient: LinearGradient(
              colors: [
                Colors.blue.withValues(alpha: 0.4),
                Colors.purple.withValues(alpha: 0.4),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            child: const Center(
              child: Text('Horizontal', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-002',
          title: 'LinearGradient - vertical',
          description: 'Top to bottom gradient',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            gradient: LinearGradient(
              colors: [
                Colors.green.withValues(alpha: 0.4),
                Colors.teal.withValues(alpha: 0.4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            child: const Center(
              child: Text('Vertical', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-003',
          title: 'LinearGradient - diagonal',
          description: 'TopLeft to BottomRight',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            gradient: LinearGradient(
              colors: [
                Colors.orange.withValues(alpha: 0.4),
                Colors.red.withValues(alpha: 0.4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            child: const Center(
              child: Text('Diagonal', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-004',
          title: 'RadialGradient',
          description: 'Center outward radial',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 100,
            width: double.infinity,
            gradient: RadialGradient(
              colors: [
                Colors.yellow.withValues(alpha: 0.4),
                Colors.orange.withValues(alpha: 0.2),
              ],
              radius: 0.8,
            ),
            child: const Center(
              child: Text('Radial', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-005',
          title: 'SweepGradient',
          description: 'Circular sweep gradient',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 100,
            width: double.infinity,
            gradient: SweepGradient(
              colors: [
                Colors.red.withValues(alpha: 0.3),
                Colors.green.withValues(alpha: 0.3),
                Colors.blue.withValues(alpha: 0.3),
                Colors.red.withValues(alpha: 0.3),
              ],
            ),
            child: const Center(
              child: Text('Sweep', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-006',
          title: 'Multiple color stops',
          description: 'Gradient with custom stops',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            gradient: LinearGradient(
              colors: [
                Colors.red.withValues(alpha: 0.4),
                Colors.yellow.withValues(alpha: 0.4),
                Colors.green.withValues(alpha: 0.4),
                Colors.blue.withValues(alpha: 0.4),
              ],
              stops: const [0.0, 0.3, 0.6, 1.0],
            ),
            child: const Center(
              child: Text('Multi-stop', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        // ============================================
        // COLORS
        // ============================================
        const SampleSection('Colors'),

        SampleCaseWidget(SampleCase(
          id: 'DEC-007',
          title: 'Solid color (no gradient)',
          description: 'Using color instead of gradient',
          status: SampleStatus.passing,
          widget: GlassContainer(
            height: 70,
            width: double.infinity,
            color: Colors.purple.withValues(alpha: 0.3),
            borderColor: Colors.purple.withValues(alpha: 0.5),
            child: const Center(
              child:
                  Text('Solid Purple', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-008',
          title: 'High opacity color',
          description: 'Alpha 0.6 for stronger color',
          status: SampleStatus.passing,
          widget: GlassContainer(
            height: 70,
            width: double.infinity,
            color: Colors.blue.withValues(alpha: 0.6),
            borderColor: Colors.blue.withValues(alpha: 0.8),
            child: const Center(
              child: Text('High Opacity (0.6)',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-009',
          title: 'Low opacity color',
          description: 'Alpha 0.1 for subtle tint',
          status: SampleStatus.passing,
          widget: GlassContainer(
            height: 70,
            width: double.infinity,
            color: Colors.white.withValues(alpha: 0.1),
            borderColor: Colors.white.withValues(alpha: 0.2),
            child: const Center(
              child: Text('Low Opacity (0.1)',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        // ============================================
        // BORDERS
        // ============================================
        const SampleSection('Borders'),

        SampleCaseWidget(SampleCase(
          id: 'DEC-010',
          title: 'borderWidth: 0.5 (thin)',
          description: 'Hairline border',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 60,
            width: 200,
            borderWidth: 0.5,
            child: const Center(
              child: Text('0.5px', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-011',
          title: 'borderWidth: 2.0',
          description: 'Medium border',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 60,
            width: 200,
            borderWidth: 2.0,
            child: const Center(
              child: Text('2.0px', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-012',
          title: 'borderWidth: 4.0 (thick)',
          description: 'Heavy border',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 60,
            width: 200,
            borderWidth: 4.0,
            child: const Center(
              child: Text('4.0px', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-013',
          title: 'borderRadius: 0 (sharp)',
          description: 'No corner rounding',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 60,
            width: 200,
            borderRadius: BorderRadius.zero,
            child: const Center(
              child:
                  Text('Sharp corners', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-014',
          title: 'borderRadius: 30 (pill)',
          description: 'Very rounded corners',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 60,
            width: 200,
            borderRadius: BorderRadius.circular(30),
            child: const Center(
              child: Text('Pill shape', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-015',
          title: 'Asymmetric borderRadius',
          description: 'Different corners',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 70,
            width: 200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(24),
            ),
            child: const Center(
              child: Text('Asymmetric', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-016',
          title: 'Border gradient',
          description: 'Gradient border instead of solid',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 70,
            width: 200,
            borderWidth: 2,
            borderGradient: const LinearGradient(
              colors: [Colors.cyan, Colors.purple],
            ),
            child: const Center(
              child: Text('Gradient border',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        // ============================================
        // SHADOWS
        // ============================================
        const SampleSection('Shadows'),

        SampleCaseWidget(SampleCase(
          id: 'DEC-017',
          title: 'Single shadow',
          description: 'Standard drop shadow',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 70,
              width: 200,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
              child: const Center(
                child: Text('Shadow', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-018',
          title: 'Colored shadow',
          description: 'Purple glow shadow',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 70,
              width: 200,
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withValues(alpha: 0.5),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
              child: const Center(
                child: Text('Glow', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        // ============================================
        // SPACING
        // ============================================
        const SampleSection('Spacing'),

        SampleCaseWidget(SampleCase(
          id: 'DEC-019',
          title: 'Padding variations',
          description: 'All, symmetric, only',
          status: SampleStatus.passing,
          widget: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GlassContainer.clearGlass(
                padding: const EdgeInsets.all(16),
                child: const Text('all(16)',
                    style: TextStyle(color: Colors.white, fontSize: 11)),
              ),
              GlassContainer.clearGlass(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: const Text('sym',
                    style: TextStyle(color: Colors.white, fontSize: 11)),
              ),
              GlassContainer.clearGlass(
                padding: const EdgeInsets.only(
                    left: 20, right: 8, top: 4, bottom: 16),
                child: const Text('only',
                    style: TextStyle(color: Colors.white, fontSize: 11)),
              ),
            ],
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'DEC-020',
          title: 'Margin + padding combined',
          description: 'Outer margin with inner padding',
          status: SampleStatus.passing,
          widget: Container(
            color: Colors.white.withValues(alpha: 0.1),
            child: GlassContainer.clearGlass(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Margin: 16, Padding: 20',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )),

        const SizedBox(height: 32),
      ],
    );
  }
}
