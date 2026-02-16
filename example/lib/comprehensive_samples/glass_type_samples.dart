import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'sample_home.dart';

/// Glass Type Tests
/// Tests clear glass, frosted glass, and variations
class GlassTypeSamplesPage extends StatelessWidget {
  const GlassTypeSamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SamplePageScaffold(
      title: 'Glass Types',
      subtitle: '14 samples • Clear, frosted, blur variations',
      children: [
        // ============================================
        // CLEAR GLASS
        // ============================================
        const SampleSection('Clear Glass'),

        SampleCaseWidget(SampleCase(
          id: 'GLT-001',
          title: 'Default clearGlass',
          description: 'Standard clear glass with default settings',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            child: const Center(
              child:
                  Text('Default Clear', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-002',
          title: 'Clear glass - blur: 0',
          description: 'No blur, transparent glass',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            blur: 0,
            child: const Center(
              child: Text('No Blur (0)', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-003',
          title: 'Clear glass - blur: 5',
          description: 'Light blur effect',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            blur: 5,
            child: const Center(
              child:
                  Text('Light Blur (5)', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-004',
          title: 'Clear glass - blur: 15',
          description: 'Medium blur effect',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            blur: 15,
            child: const Center(
              child: Text('Medium Blur (15)',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-005',
          title: 'Clear glass - blur: 30',
          description: 'Heavy blur effect',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            blur: 30,
            child: const Center(
              child: Text('Heavy Blur (30)',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-006',
          title: 'Clear glass - custom gradient',
          description: 'Clear glass with custom colors',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            gradient: LinearGradient(
              colors: [
                Colors.cyan.withValues(alpha: 0.3),
                Colors.blue.withValues(alpha: 0.15),
              ],
            ),
            child: const Center(
              child: Text('Custom Gradient',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        // ============================================
        // FROSTED GLASS
        // ============================================
        const SampleSection('Frosted Glass'),

        SampleCaseWidget(SampleCase(
          id: 'GLT-007',
          title: 'Default frostedGlass',
          description: 'Standard frosted glass with default settings',
          status: SampleStatus.passing,
          widget: GlassContainer.frostedGlass(
            height: 80,
            width: double.infinity,
            child: const Center(
              child: Text('Default Frosted',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-008',
          title: 'Frosted - frostedOpacity: 0.05',
          description: 'Very subtle frosting',
          status: SampleStatus.passing,
          widget: GlassContainer.frostedGlass(
            height: 80,
            width: double.infinity,
            frostedOpacity: 0.05,
            child: const Center(
              child:
                  Text('Opacity: 0.05', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-009',
          title: 'Frosted - frostedOpacity: 0.15',
          description: 'Medium frosting',
          status: SampleStatus.passing,
          widget: GlassContainer.frostedGlass(
            height: 80,
            width: double.infinity,
            frostedOpacity: 0.15,
            child: const Center(
              child:
                  Text('Opacity: 0.15', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-010',
          title: 'Frosted - frostedOpacity: 0.25',
          description: 'Heavy frosting',
          status: SampleStatus.passing,
          widget: GlassContainer.frostedGlass(
            height: 80,
            width: double.infinity,
            frostedOpacity: 0.25,
            child: const Center(
              child:
                  Text('Opacity: 0.25', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-011',
          title: 'Frosted - frostedOpacity: 0.35',
          description: 'Very heavy frosting',
          status: SampleStatus.passing,
          widget: GlassContainer.frostedGlass(
            height: 80,
            width: double.infinity,
            frostedOpacity: 0.35,
            child: const Center(
              child:
                  Text('Opacity: 0.35', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-012',
          title: 'Frosted with custom gradient',
          description: 'Frosted glass with purple gradient',
          status: SampleStatus.passing,
          widget: GlassContainer.frostedGlass(
            height: 80,
            width: double.infinity,
            gradient: LinearGradient(
              colors: [
                Colors.purple.withValues(alpha: 0.35),
                Colors.pink.withValues(alpha: 0.2),
              ],
            ),
            child: const Center(
              child:
                  Text('Purple Frost', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        // ============================================
        // BASE CONSTRUCTOR
        // ============================================
        const SampleSection('Base Constructor'),

        SampleCaseWidget(SampleCase(
          id: 'GLT-013',
          title: 'GlassContainer() with isFrostedGlass: true',
          description: 'Using base constructor for frosted effect',
          status: SampleStatus.passing,
          widget: GlassContainer(
            height: 80,
            width: double.infinity,
            isFrostedGlass: true,
            frostedOpacity: 0.12,
            gradient: LinearGradient(
              colors: [
                Colors.white.withValues(alpha: 0.25),
                Colors.white.withValues(alpha: 0.1),
              ],
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withValues(alpha: 0.4),
                Colors.white.withValues(alpha: 0.1),
              ],
            ),
            child: const Center(
              child:
                  Text('Base + Frosted', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'GLT-014',
          title: 'GlassContainer() with isFrostedGlass: false',
          description: 'Using base constructor for clear effect',
          status: SampleStatus.passing,
          widget: GlassContainer(
            height: 80,
            width: double.infinity,
            isFrostedGlass: false,
            gradient: LinearGradient(
              colors: [
                Colors.green.withValues(alpha: 0.3),
                Colors.teal.withValues(alpha: 0.15),
              ],
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.green.withValues(alpha: 0.5),
                Colors.teal.withValues(alpha: 0.2),
              ],
            ),
            child: const Center(
              child:
                  Text('Base + Clear', style: TextStyle(color: Colors.white)),
            ),
          ),
        )),

        const SizedBox(height: 32),
      ],
    );
  }
}
