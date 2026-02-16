import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'sample_home.dart';

/// Flex Layout Samples
/// Samples GlassContainer in Row, Column, Expanded, Flexible contexts
class FlexSamplesPage extends StatelessWidget {
  const FlexSamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SamplePageScaffold(
      title: 'Flex Layouts',
      subtitle: '20 samples • Row, Column, Expanded, Flexible behavior',
      children: [
        // ============================================
        // ROW CONTEXTS
        // ============================================
        const SampleSection('Row Contexts'),

        SampleCaseWidget(SampleCase(
          id: 'FLX-001',
          title: 'Expanded child in Row',
          description: 'GlassContainer fills remaining space',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 60,
            child: Row(
              children: [
                GlassContainer.clearGlass(
                  height: 60,
                  width: 80,
                  child: const Center(
                    child: Text('Fixed',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GlassContainer.clearGlass(
                    height: 60,
                    child: const Center(
                      child: Text('Expanded',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-002',
          title: 'Flexible with flex factors (1:2)',
          description: 'Two containers with 1:2 ratio',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 60,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GlassContainer.clearGlass(
                    height: 60,
                    child: const Center(
                      child: Text('Flex 1',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 2,
                  child: GlassContainer.clearGlass(
                    height: 60,
                    child: const Center(
                      child: Text('Flex 2',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-003',
          title: 'Flexible 1:2:1 ratio',
          description: 'Three containers in 1:2:1 proportion',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 60,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GlassContainer.clearGlass(
                    height: 60,
                    child: const Center(
                      child: Text('1', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 2,
                  child: GlassContainer.frostedGlass(
                    height: 60,
                    child: const Center(
                      child: Text('2', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: GlassContainer.clearGlass(
                    height: 60,
                    child: const Center(
                      child: Text('1', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-004',
          title: 'Mixed fixed + Expanded',
          description: 'Fixed width containers with expanded center',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 60,
            child: Row(
              children: [
                GlassContainer.clearGlass(
                  height: 60,
                  width: 60,
                  child: const Center(
                      child: Icon(Icons.menu, color: Colors.white)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GlassContainer.clearGlass(
                    height: 60,
                    child: const Center(
                      child: Text('Content Area',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GlassContainer.clearGlass(
                  height: 60,
                  width: 60,
                  child: const Center(
                      child: Icon(Icons.settings, color: Colors.white)),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-005',
          title: 'MainAxisAlignment.spaceEvenly',
          description: 'Even spacing between items',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlassContainer.clearGlass(
                  height: 50,
                  width: 70,
                  child: const Center(
                      child: Text('A', style: TextStyle(color: Colors.white))),
                ),
                GlassContainer.clearGlass(
                  height: 50,
                  width: 70,
                  child: const Center(
                      child: Text('B', style: TextStyle(color: Colors.white))),
                ),
                GlassContainer.clearGlass(
                  height: 50,
                  width: 70,
                  child: const Center(
                      child: Text('C', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ),
        )),

        // ============================================
        // FLEXIBLE VS EXPANDED BEHAVIOR
        // ============================================
        const SampleSection('Flexible vs Expanded Behavior'),

        SampleCaseWidget(SampleCase(
          id: 'FLX-006',
          title: 'Flexible (loose) - takes only needed space',
          description: 'FlexFit.loose: container shrinks to content size',
          status: SampleStatus.passing,
          widget: Container(
            height: 60,
            color: Colors.white.withValues(alpha: 0.1),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: GlassContainer.clearGlass(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Loose',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 8),
                const Text('← Only takes needed space',
                    style: TextStyle(color: Colors.white54, fontSize: 10)),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-007',
          title: 'Flexible (tight/Expanded) - fills space',
          description:
              'FlexFit.tight: container expands to fill available space',
          status: SampleStatus.passing,
          widget: Container(
            height: 60,
            color: Colors.white.withValues(alpha: 0.1),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight, // Same as Expanded
                  child: GlassContainer.clearGlass(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Center(
                      child: Text('Tight (expands to fill)',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-008',
          title: 'Loose vs Tight side-by-side',
          description: 'Compare behavior in same Row',
          status: SampleStatus.passing,
          widget: Container(
            height: 70,
            color: Colors.white.withValues(alpha: 0.1),
            child: Row(
              children: [
                // Loose - only takes what it needs
                Flexible(
                  fit: FlexFit.loose,
                  child: GlassContainer.clearGlass(
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    child: const Text('Loose',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 8),
                // Tight - expands
                Flexible(
                  fit: FlexFit.tight,
                  child: GlassContainer.frostedGlass(
                    height: 60,
                    child: const Center(
                      child: Text(
                          'Tight (fills remaining) after setting constraints as per flex widgets in row',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-009',
          title: 'Multiple Flexible (loose) in Row',
          description:
              'All containers shrink to content, remaining space is empty',
          status: SampleStatus.passing,
          widget: Container(
            height: 60,
            color: Colors.white.withValues(alpha: 0.1),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: GlassContainer.clearGlass(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child:
                        const Text('A', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  fit: FlexFit.loose,
                  child: GlassContainer.clearGlass(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Text('Longer B',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  fit: FlexFit.loose,
                  child: GlassContainer.clearGlass(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child:
                        const Text('C', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const Spacer(), // Shows remaining space
                const Text('← Empty',
                    style: TextStyle(color: Colors.white38, fontSize: 10)),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-010',
          title: 'Flexible loose in Column',
          description: 'Vertical: containers take only needed height',
          status: SampleStatus.passing,
          widget: Container(
            height: 180,
            width: double.infinity,
            color: Colors.white.withValues(alpha: 0.1),
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: GlassContainer.clearGlass(
                    padding: const EdgeInsets.all(12),
                    child: const Text('Takes only needed height',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  fit: FlexFit.loose,
                  child: GlassContainer.clearGlass(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: const Text('Also shrinks to content',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const Spacer(),
                const Text('↑ Remaining space empty',
                    style: TextStyle(color: Colors.white38, fontSize: 10)),
              ],
            ),
          ),
        )),

        // ============================================
        // COLUMN CONTEXTS
        // ============================================
        const SampleSection('Column Contexts'),

        SampleCaseWidget(SampleCase(
          id: 'FLX-011',
          title: 'Expanded child in Column',
          description: 'GlassContainer fills remaining vertical space',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 180,
            child: Column(
              children: [
                GlassContainer.clearGlass(
                  height: 40,
                  width: double.infinity,
                  child: const Center(
                    child: Text('Header',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: GlassContainer.clearGlass(
                    width: double.infinity,
                    child: const Center(
                      child: Text('Expanded Content',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-012',
          title: 'Flexible with flex factors (1:3)',
          description: 'Two containers in 1:3 vertical ratio',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 160,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: GlassContainer.clearGlass(
                    width: double.infinity,
                    child: const Center(
                      child: Text('Flex 1',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  flex: 3,
                  child: GlassContainer.frostedGlass(
                    width: double.infinity,
                    child: const Center(
                      child: Text('Flex 3',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-013',
          title: 'Mixed fixed + Expanded (Column)',
          description: 'Fixed header/footer with expanded body',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 200,
            child: Column(
              children: [
                GlassContainer.clearGlass(
                  height: 40,
                  width: double.infinity,
                  child: const Center(
                    child: Text('Header',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: GlassContainer.frostedGlass(
                    width: double.infinity,
                    child: const Center(
                      child: Text('Body',
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GlassContainer.clearGlass(
                  height: 40,
                  width: double.infinity,
                  child: const Center(
                    child: Text('Footer',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-014',
          title: 'CrossAxisAlignment.stretch',
          description: 'Items stretch to fill width',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassContainer.clearGlass(
                  height: 40,
                  child: const Center(
                    child: Text('Stretched',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(height: 8),
                GlassContainer.clearGlass(
                  height: 40,
                  child: const Center(
                    child: Text('Full Width',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
              ],
            ),
          ),
        )),

        // ============================================
        // NESTED FLEX
        // ============================================
        const SampleSection('Nested Flex'),

        SampleCaseWidget(SampleCase(
          id: 'FLX-015',
          title: 'Row in Column',
          description: 'Horizontal row within vertical column',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 160,
            child: Column(
              children: [
                GlassContainer.clearGlass(
                  height: 40,
                  width: double.infinity,
                  child: const Center(
                    child: Text('Top',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GlassContainer.clearGlass(
                          child: const Center(
                            child: Text('Left',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GlassContainer.frostedGlass(
                          child: const Center(
                            child: Text('Right',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-016',
          title: 'Column in Row',
          description: 'Vertical column within horizontal row',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 120,
            child: Row(
              children: [
                GlassContainer.clearGlass(
                  height: 120,
                  width: 80,
                  child: const Center(
                    child: Text('Side',
                        style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: GlassContainer.clearGlass(
                          width: double.infinity,
                          child: const Center(
                            child: Text('Top',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: GlassContainer.frostedGlass(
                          width: double.infinity,
                          child: const Center(
                            child: Text('Bottom',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-017',
          title: 'Complex 2x2 grid',
          description: 'Grid layout using nested flex',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 160,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GlassContainer.clearGlass(
                          child: const Center(
                              child: Text('1',
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GlassContainer.frostedGlass(
                          child: const Center(
                              child: Text('2',
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GlassContainer.frostedGlass(
                          child: const Center(
                              child: Text('3',
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GlassContainer.clearGlass(
                          child: const Center(
                              child: Text('4',
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-018',
          title: 'Dashboard layout',
          description: 'Sidebar + header + content grid',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 200,
            child: Row(
              children: [
                // Sidebar
                GlassContainer.frostedGlass(
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.home, color: Colors.white),
                      Icon(Icons.search, color: Colors.white54),
                      Icon(Icons.person, color: Colors.white54),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Main content
                Expanded(
                  child: Column(
                    children: [
                      // Header
                      GlassContainer.clearGlass(
                        height: 40,
                        width: double.infinity,
                        child: const Center(
                          child: Text('Dashboard',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Content grid
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: GlassContainer.clearGlass(
                                child: const Center(
                                  child: Text('Main',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: GlassContainer.clearGlass(
                                child: const Center(
                                  child: Text('Side',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-019',
          title: 'CrossAxisAlignment.start',
          description: 'Items aligned to start of cross axis',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassContainer.clearGlass(
                  height: 40,
                  width: 80,
                  child: const Center(
                      child: Text('Small',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                ),
                const SizedBox(width: 8),
                GlassContainer.clearGlass(
                  height: 60,
                  width: 80,
                  child: const Center(
                      child: Text('Medium',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                ),
                const SizedBox(width: 8),
                GlassContainer.clearGlass(
                  height: 80,
                  width: 80,
                  child: const Center(
                      child: Text('Large',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'FLX-020',
          title: 'CrossAxisAlignment.center',
          description: 'Items centered on cross axis',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GlassContainer.clearGlass(
                  height: 30,
                  width: 80,
                  child: const Center(
                      child: Text('Small',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                ),
                const SizedBox(width: 8),
                GlassContainer.clearGlass(
                  height: 50,
                  width: 80,
                  child: const Center(
                      child: Text('Medium',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                ),
                const SizedBox(width: 8),
                GlassContainer.clearGlass(
                  height: 80,
                  width: 80,
                  child: const Center(
                      child: Text('Large',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                ),
              ],
            ),
          ),
        )),

        const SizedBox(height: 32),
      ],
    );
  }
}
