import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'layout_samples.dart';
import 'decoration_samples.dart';
import 'shape_samples.dart';
import 'glass_type_samples.dart';
import 'transform_samples.dart';
import 'flex_samples.dart';
import 'special_widget_samples.dart';
import 'nested_samples.dart';

/// Main sample categories screen - hub for all comprehensive samples
class SampleHomePage extends StatelessWidget {
  const SampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Comprehensive Samples',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '8 categories • All GlassContainer properties',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Category Grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    children: [
                      _buildCategoryCard(
                        context,
                        icon: Icons.straighten,
                        title: 'Layout & Sizing',
                        sampleCount: 16,
                        color: Colors.blue,
                        onTap: () =>
                            _navigateTo(context, const LayoutSamplesPage()),
                      ),
                      _buildCategoryCard(
                        context,
                        icon: Icons.palette,
                        title: 'Decoration',
                        sampleCount: 20,
                        color: Colors.purple,
                        onTap: () =>
                            _navigateTo(context, const DecorationSamplesPage()),
                      ),
                      _buildCategoryCard(
                        context,
                        icon: Icons.category,
                        title: 'Shapes',
                        sampleCount: 12,
                        color: Colors.teal,
                        onTap: () =>
                            _navigateTo(context, const ShapeSamplesPage()),
                      ),
                      _buildCategoryCard(
                        context,
                        icon: Icons.blur_on,
                        title: 'Glass Types',
                        sampleCount: 14,
                        color: Colors.indigo,
                        onTap: () =>
                            _navigateTo(context, const GlassTypeSamplesPage()),
                      ),
                      _buildCategoryCard(
                        context,
                        icon: Icons.transform,
                        title: 'Transform',
                        sampleCount: 12,
                        color: Colors.orange,
                        onTap: () =>
                            _navigateTo(context, const TransformSamplesPage()),
                      ),
                      _buildCategoryCard(
                        context,
                        icon: Icons.view_column,
                        title: 'Flex Layouts',
                        sampleCount: 20,
                        color: Colors.green,
                        onTap: () =>
                            _navigateTo(context, const FlexSamplesPage()),
                      ),
                      _buildCategoryCard(
                        context,
                        icon: Icons.widgets,
                        title: 'Special Widgets',
                        sampleCount: 14,
                        color: Colors.pink,
                        onTap: () => _navigateTo(
                            context, const SpecialWidgetSamplesPage()),
                      ),
                      _buildCategoryCard(
                        context,
                        icon: Icons.layers,
                        title: 'Nested',
                        sampleCount: 10,
                        color: Colors.amber,
                        onTap: () =>
                            _navigateTo(context, const NestedSamplesPage()),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int sampleCount,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer.frostedGlass(
        padding: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.25),
            color.withValues(alpha: 0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderGradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.5),
            color.withValues(alpha: 0.2),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$sampleCount samples',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Sample status for tracking sample cases
enum SampleStatus {
  passing,
  knownIssue,
  experimental,
}

/// Test case data structure
class SampleCase {
  final String id;
  final String title;
  final String description;
  final SampleStatus status;
  final Widget widget;

  const SampleCase({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.widget,
  });
}

/// Base scaffold for test pages with consistent styling
class SamplePageScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const SamplePageScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Test content
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section title widget for test categories
class SampleSection extends StatelessWidget {
  final String title;

  const SampleSection(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual test case widget with status indicator
class SampleCaseWidget extends StatelessWidget {
  final SampleCase sampleCase;

  const SampleCaseWidget(this.sampleCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              _buildStatusBadge(),
              const SizedBox(width: 8),
              Text(
                sampleCase.id,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 11,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  sampleCase.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            sampleCase.description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 8),
          // Sample widget
          sampleCase.widget,
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color color;
    IconData icon;
    switch (sampleCase.status) {
      case SampleStatus.passing:
        color = Colors.green;
        icon = Icons.check_circle;
      case SampleStatus.knownIssue:
        color = Colors.orange;
        icon = Icons.warning;
      case SampleStatus.experimental:
        color = Colors.blue;
        icon = Icons.science;
    }
    return Icon(icon, color: color, size: 14);
  }
}
