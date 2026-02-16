import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'sample_home.dart';

/// Special Widget Samples
/// Samples GlassContainer in special widget contexts
class SpecialWidgetSamplesPage extends StatelessWidget {
  const SpecialWidgetSamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SamplePageScaffold(
      title: 'Special Widgets',
      subtitle: '14 samples • IntrinsicHeight, Wrap, Stack, GridView, etc.',
      children: [
        // ============================================
        // INTRINSIC HEIGHT/WIDTH
        // ============================================
        const SampleSection('IntrinsicHeight / IntrinsicWidth'),

        SampleCaseWidget(SampleCase(
          id: 'SPW-001',
          title: 'IntrinsicHeight + CrossAxisAlignment.stretch',
          description: 'Equal height based on tallest child',
          status: SampleStatus.passing,
          widget: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassContainer.clearGlass(
                  width: 100,
                  padding: const EdgeInsets.all(12),
                  child: const Text('Short',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 8),
                GlassContainer.clearGlass(
                  width: 100,
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    'Longer\ncontent\nhere',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                GlassContainer.frostedGlass(
                  width: 100,
                  padding: const EdgeInsets.all(12),
                  child:
                      const Text('Med', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SPW-002',
          title: 'IntrinsicWidth',
          description: 'Width based on widest child',
          status: SampleStatus.passing,
          widget: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassContainer.clearGlass(
                  padding: const EdgeInsets.all(12),
                  child: const Text('Short',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 8),
                GlassContainer.clearGlass(
                  padding: const EdgeInsets.all(12),
                  child: const Text('Much longer text here',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 8),
                GlassContainer.clearGlass(
                  padding: const EdgeInsets.all(12),
                  child: const Text('Medium',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        )),

        // ============================================
        // WRAP WIDGET
        // ============================================
        const SampleSection('Wrap Widget'),

        SampleCaseWidget(SampleCase(
          id: 'SPW-003',
          title: 'Wrap - tag/chip style',
          description: 'Tags that wrap to next line',
          status: SampleStatus.passing,
          widget: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GlassContainer.clearGlass(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: const Text('Flutter',
                    style: TextStyle(color: Colors.white)),
              ),
              GlassContainer.clearGlass(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child:
                    const Text('Dart', style: TextStyle(color: Colors.white)),
              ),
              GlassContainer.frostedGlass(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: const Text('GlassKit',
                    style: TextStyle(color: Colors.white)),
              ),
              GlassContainer.clearGlass(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: const Text('UI', style: TextStyle(color: Colors.white)),
              ),
              GlassContainer.clearGlass(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child:
                    const Text('Design', style: TextStyle(color: Colors.white)),
              ),
              GlassContainer.clearGlass(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: const Text('Glassmorphism',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SPW-004',
          title: 'Wrap with icons',
          description: 'Icon chips in wrap layout',
          status: SampleStatus.passing,
          widget: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GlassContainer.clearGlass(
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 16),
                    SizedBox(width: 4),
                    Text('Like',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
              GlassContainer.clearGlass(
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.share, color: Colors.blue, size: 16),
                    SizedBox(width: 4),
                    Text('Share',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
              GlassContainer.clearGlass(
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.bookmark, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('Save',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        )),

        // ============================================
        // STACK WIDGET
        // ============================================
        const SampleSection('Stack Widget'),

        SampleCaseWidget(SampleCase(
          id: 'SPW-005',
          title: 'Positioned absolute',
          description: 'Glass containers at specific positions',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 150,
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 10,
                  child: GlassContainer.clearGlass(
                    padding: const EdgeInsets.all(12),
                    child: const Text('Top Left',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: GlassContainer.frostedGlass(
                    height: 50,
                    width: 100,
                    child: const Center(
                      child: Text('Bottom',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SPW-006',
          title: 'Positioned.fill',
          description: 'Glass container fills stack',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 100,
            child: Stack(
              children: [
                Positioned.fill(
                  child: GlassContainer.clearGlass(
                    child: const Center(
                      child: Text('Fills Parent',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: GlassContainer.frostedGlass(
                    height: 30,
                    width: 30,
                    shape: BoxShape.circle,
                    child: const Center(
                      child: Icon(Icons.close, color: Colors.white, size: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SPW-007',
          title: 'Multiple overlapping',
          description: 'Stacked glass containers',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 120,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: GlassContainer.clearGlass(
                    height: 80,
                    width: 150,
                    child: const Center(
                      child:
                          Text('Back', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 30,
                  child: GlassContainer.frostedGlass(
                    height: 80,
                    width: 150,
                    child: const Center(
                      child:
                          Text('Front', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        // ============================================
        // GRIDVIEW
        // ============================================
        const SampleSection('GridView'),

        SampleCaseWidget(SampleCase(
          id: 'SPW-008',
          title: 'GridView.count',
          description: '2-column grid with glass containers',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 200,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5,
              children: [
                GlassContainer.clearGlass(
                  child: const Center(
                      child: Text('1', style: TextStyle(color: Colors.white))),
                ),
                GlassContainer.clearGlass(
                  child: const Center(
                      child: Text('2', style: TextStyle(color: Colors.white))),
                ),
                GlassContainer.frostedGlass(
                  child: const Center(
                      child: Text('3', style: TextStyle(color: Colors.white))),
                ),
                GlassContainer.clearGlass(
                  child: const Center(
                      child: Text('4', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SPW-009',
          title: 'GridView.builder',
          description: 'Builder pattern with glass cards',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 180,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => GlassContainer.clearGlass(
                child: Center(
                  child: Text('${index + 1}',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ),
        )),

        // ============================================
        // SIZEDBOX WRAPPER
        // ============================================
        const SampleSection('SizedBox Wrapper'),

        SampleCaseWidget(SampleCase(
          id: 'SPW-010',
          title: 'SizedBox with explicit dimensions',
          description: 'Glass container inherits SizedBox size',
          status: SampleStatus.passing,
          widget: Center(
            child: SizedBox(
              height: 80,
              width: 200,
              child: GlassContainer.clearGlass(
                child: const Center(
                  child: Text('In SizedBox',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        )),

        // ============================================
        // SCROLLVIEW
        // ============================================
        const SampleSection('ScrollView'),

        SampleCaseWidget(SampleCase(
          id: 'SPW-011',
          title: 'Horizontal SingleChildScrollView',
          description: 'Horizontal scrolling glass items',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  8,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GlassContainer.clearGlass(
                      height: 70,
                      width: 100,
                      child: Center(
                        child: Text('Item ${index + 1}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )),

        // ============================================
        // LISTVIEW
        // ============================================
        const SampleSection('ListView'),

        SampleCaseWidget(SampleCase(
          id: 'SPW-012',
          title: 'Vertical ListView',
          description: 'Scrollable list of glass containers',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 200,
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) => GlassContainer.clearGlass(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    GlassContainer.frostedGlass(
                      height: 40,
                      width: 40,
                      shape: BoxShape.circle,
                      child: Center(
                        child: Text('${index + 1}',
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text('List Item ${index + 1}',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'SPW-013',
          title: 'Horizontal ListView.builder',
          description: 'Horizontal scrollable glass cards',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GlassContainer.clearGlass(
                  height: 90,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image,
                          color: Colors.white.withValues(alpha: 0.7)),
                      const SizedBox(height: 4),
                      Text('Card ${index + 1}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),

        // ============================================
        // ANIMATED CONTAINER
        // ============================================
        const SampleSection('Container Wrapping'),

        SampleCaseWidget(SampleCase(
          id: 'SPW-014',
          title: 'Inside Container with decoration',
          description: 'Glass on top of decorated container',
          status: SampleStatus.passing,
          widget: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            padding: const EdgeInsets.all(12),
            child: GlassContainer.clearGlass(
              child: const Center(
                child: Text('Nested in Container',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        const SizedBox(height: 32),
      ],
    );
  }
}
