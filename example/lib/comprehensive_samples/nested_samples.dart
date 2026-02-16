import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'sample_home.dart';

/// Nested Scenarios Samples
/// Samples nested glass containers and complex layouts
class NestedSamplesPage extends StatelessWidget {
  const NestedSamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SamplePageScaffold(
      title: 'Nested Scenarios',
      subtitle: '10 samples • Glass in glass, multi-level nesting',
      children: [
        // ============================================
        // GLASS IN GLASS
        // ============================================
        const SampleSection('Glass in Glass'),

        SampleCaseWidget(SampleCase(
          id: 'NST-001',
          title: 'clearGlass inside clearGlass',
          description: 'Nested clear glass containers',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: GlassContainer.clearGlass(
              padding: const EdgeInsets.all(16),
              borderRadius: BorderRadius.circular(8),
              child: const Center(
                child:
                    Text('Inner Clear', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'NST-002',
          title: 'frostedGlass inside frostedGlass',
          description: 'Nested frosted glass containers',
          status: SampleStatus.passing,
          widget: GlassContainer.frostedGlass(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: GlassContainer.frostedGlass(
              padding: const EdgeInsets.all(16),
              borderRadius: BorderRadius.circular(8),
              child: const Center(
                child: Text('Inner Frosted',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'NST-003',
          title: 'clearGlass inside frostedGlass',
          description: 'Clear glass nested in frosted',
          status: SampleStatus.passing,
          widget: GlassContainer.frostedGlass(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: GlassContainer.clearGlass(
              padding: const EdgeInsets.all(16),
              borderRadius: BorderRadius.circular(8),
              child: const Center(
                child: Text('Clear in Frosted',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'NST-004',
          title: 'frostedGlass inside clearGlass',
          description: 'Frosted glass nested in clear',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: GlassContainer.frostedGlass(
              padding: const EdgeInsets.all(16),
              borderRadius: BorderRadius.circular(8),
              child: const Center(
                child: Text('Frosted in Clear',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        // ============================================
        // MULTI-LEVEL NESTING
        // ============================================
        const SampleSection('Multi-level Nesting'),

        SampleCaseWidget(SampleCase(
          id: 'NST-005',
          title: 'Glass in Card in Glass',
          description: 'Three levels of nesting with Card',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Card(
              color: Colors.white.withValues(alpha: 0.1),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GlassContainer.frostedGlass(
                  padding: const EdgeInsets.all(12),
                  child: const Center(
                    child:
                        Text('Deepest', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'NST-006',
          title: 'Glass in Container in Glass',
          description: 'Glass with transparent Container layer',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 130,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: GlassContainer.clearGlass(
                borderRadius: BorderRadius.circular(4),
                padding: const EdgeInsets.all(12),
                child: const Center(
                  child: Text('Nested', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'NST-007',
          title: '3+ levels deep',
          description: 'Deeply nested glass containers',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: GlassContainer.frostedGlass(
              padding: const EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(12),
              child: GlassContainer.clearGlass(
                padding: const EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(8),
                child: GlassContainer.frostedGlass(
                  padding: const EdgeInsets.all(16),
                  borderRadius: BorderRadius.circular(4),
                  child: const Center(
                    child:
                        Text('Level 4', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
        )),

        // ============================================
        // COMPLEX LAYOUTS
        // ============================================
        const SampleSection('Complex Layouts'),

        SampleCaseWidget(SampleCase(
          id: 'NST-008',
          title: 'Nested rows with glass',
          description: 'Row of glass with nested row inside',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: GlassContainer.clearGlass(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GlassContainer.frostedGlass(
                          height: 40,
                          width: 40,
                          shape: BoxShape.circle,
                          child: const Icon(Icons.star,
                              color: Colors.white, size: 16),
                        ),
                        GlassContainer.frostedGlass(
                          height: 40,
                          width: 40,
                          shape: BoxShape.circle,
                          child: const Icon(Icons.favorite,
                              color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GlassContainer.frostedGlass(
                    child: const Center(
                      child:
                          Text('Side', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'NST-009',
          title: 'Grid of nested glass',
          description: '2x2 grid with nested containers',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GlassContainer.clearGlass(
                          padding: const EdgeInsets.all(8),
                          child: GlassContainer.frostedGlass(
                            borderRadius: BorderRadius.circular(8),
                            child: const Center(
                                child: Text('1',
                                    style: TextStyle(color: Colors.white))),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GlassContainer.frostedGlass(
                          padding: const EdgeInsets.all(8),
                          child: GlassContainer.clearGlass(
                            borderRadius: BorderRadius.circular(8),
                            child: const Center(
                                child: Text('2',
                                    style: TextStyle(color: Colors.white))),
                          ),
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
                          padding: const EdgeInsets.all(8),
                          child: GlassContainer.clearGlass(
                            borderRadius: BorderRadius.circular(8),
                            child: const Center(
                                child: Text('3',
                                    style: TextStyle(color: Colors.white))),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GlassContainer.clearGlass(
                          padding: const EdgeInsets.all(8),
                          child: GlassContainer.frostedGlass(
                            borderRadius: BorderRadius.circular(8),
                            child: const Center(
                                child: Text('4',
                                    style: TextStyle(color: Colors.white))),
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
          id: 'NST-010',
          title: 'Dashboard-style layout',
          description: 'Complex nested dashboard UI',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // Header
                GlassContainer.frostedGlass(
                  height: 40,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Text('Dashboard',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      GlassContainer.clearGlass(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        borderRadius: BorderRadius.circular(12),
                        child: const Text('Live',
                            style:
                                TextStyle(color: Colors.green, fontSize: 10)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Content area
                Expanded(
                  child: Row(
                    children: [
                      // Stats column
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: GlassContainer.clearGlass(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Users',
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 10)),
                                    const SizedBox(height: 4),
                                    const Text('1,234',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: GlassContainer.clearGlass(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Revenue',
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 10)),
                                    const SizedBox(height: 4),
                                    const Text('\$5.6K',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Chart area
                      Expanded(
                        flex: 2,
                        child: GlassContainer.frostedGlass(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Activity',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                              const SizedBox(height: 8),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildBar(0.4),
                                    _buildBar(0.7),
                                    _buildBar(0.5),
                                    _buildBar(0.9),
                                    _buildBar(0.6),
                                    _buildBar(0.8),
                                  ],
                                ),
                              ),
                            ],
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

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildBar(double heightFactor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: FractionallySizedBox(
        heightFactor: heightFactor,
        child: GlassContainer.clearGlass(
          width: 16,
          gradient: LinearGradient(
            colors: [
              Colors.blue.withValues(alpha: 0.6),
              Colors.purple.withValues(alpha: 0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(4),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
