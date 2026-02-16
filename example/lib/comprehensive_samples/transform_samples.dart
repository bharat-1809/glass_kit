import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'sample_home.dart';

/// Transform & Alignment Samples
/// Samples all transform and alignment variations for GlassContainer
class TransformSamplesPage extends StatelessWidget {
  const TransformSamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SamplePageScaffold(
      title: 'Transform & Alignment',
      subtitle: '12 samples • Transforms, rotations, alignments',
      children: [
        // ============================================
        // ALIGNMENT PROPERTY
        // ============================================
        const SampleSection('Alignment Property'),

        SampleCaseWidget(SampleCase(
          id: 'TRN-001',
          title: 'alignment: topLeft',
          description: 'Child aligned to top-left corner',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(8),
            child: const Text('TopLeft', style: TextStyle(color: Colors.white)),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-002',
          title: 'alignment: center',
          description: 'Child aligned to center',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text('Center', style: TextStyle(color: Colors.white)),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-003',
          title: 'alignment: bottomRight',
          description: 'Child aligned to bottom-right corner',
          status: SampleStatus.passing,
          widget: GlassContainer.clearGlass(
            height: 80,
            width: double.infinity,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(8),
            child: const Text('BottomRight',
                style: TextStyle(color: Colors.white)),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-004',
          title: 'All 9 alignments',
          description: 'Grid showing all alignment positions',
          status: SampleStatus.passing,
          widget: SizedBox(
            height: 220,
            child: Column(
              children: [
                // Top row
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GlassContainer.clearGlass(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(4),
                          child: const Text('TL',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: GlassContainer.clearGlass(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(4),
                          child: const Text('TC',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: GlassContainer.clearGlass(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(4),
                          child: const Text('TR',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                // Center row
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GlassContainer.clearGlass(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(4),
                          child: const Text('CL',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: GlassContainer.frostedGlass(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(4),
                          child: const Text('C',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: GlassContainer.clearGlass(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(4),
                          child: const Text('CR',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                // Bottom row
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GlassContainer.clearGlass(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(4),
                          child: const Text('BL',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: GlassContainer.clearGlass(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(4),
                          child: const Text('BC',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: GlassContainer.clearGlass(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(4),
                          child: const Text('BR',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),

        // ============================================
        // TRANSFORM PROPERTY
        // ============================================
        const SampleSection('Transform Property'),

        SampleCaseWidget(SampleCase(
          id: 'TRN-005',
          title: 'Matrix4.rotationZ()',
          description: 'Rotate 15 degrees around Z axis',
          status: SampleStatus.passing,
          widget: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GlassContainer.clearGlass(
                height: 60,
                width: 180,
                transform: Matrix4.rotationZ(15 * math.pi / 180),
                transformAlignment: Alignment.center,
                child: const Center(
                  child: Text('Rotated 15°',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-006',
          title: 'Matrix4.rotationX() (3D)',
          description: 'Tilt forward around X axis',
          status: SampleStatus.passing,
          widget: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GlassContainer.clearGlass(
                height: 80,
                width: 180,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(-0.3),
                transformAlignment: Alignment.center,
                child: const Center(
                  child: Text('Tilt X', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-007',
          title: 'Matrix4.skewX()',
          description: 'Skew horizontally',
          status: SampleStatus.passing,
          widget: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GlassContainer.clearGlass(
                height: 60,
                width: 180,
                transform: Matrix4.skewX(0.2),
                child: const Center(
                  child: Text('Skew X', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-008',
          title: 'Matrix4.translationValues()',
          description: 'Translate position',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 60,
              width: 180,
              transform: Matrix4.translationValues(20, 10, 0),
              child: const Center(
                child:
                    Text('Translated', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-009',
          title: 'Matrix4.diagonal3Values() (scale)',
          description: 'Scale to 90%',
          status: SampleStatus.passing,
          widget: Center(
            child: GlassContainer.clearGlass(
              height: 80,
              width: 200,
              transform: Matrix4.diagonal3Values(0.9, 0.9, 1),
              child: const Center(
                child:
                    Text('Scaled 90%', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-010',
          title: 'Combined transforms',
          description: 'Rotation + Scale',
          status: SampleStatus.passing,
          widget: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GlassContainer.clearGlass(
                height: 70,
                width: 180,
                transform: Matrix4.identity()
                  ..rotateZ(10 * math.pi / 180)
                  ..multiply(Matrix4.diagonal3Values(0.95, 0.95, 1)),
                transformAlignment: Alignment.center,
                child: const Center(
                  child: Text('Rotate + Scale',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        )),

        // ============================================
        // TRANSFORM ALIGNMENT
        // ============================================
        const SampleSection('Transform Alignment'),

        SampleCaseWidget(SampleCase(
          id: 'TRN-011',
          title: 'transformAlignment with rotation',
          description: 'Rotate from top-left vs center',
          status: SampleStatus.passing,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: GlassContainer.clearGlass(
                  height: 60,
                  width: 80,
                  transform: Matrix4.rotationZ(20 * math.pi / 180),
                  transformAlignment: Alignment.topLeft,
                  child: const Center(
                    child: Text('TL',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GlassContainer.clearGlass(
                  height: 60,
                  width: 80,
                  transform: Matrix4.rotationZ(20 * math.pi / 180),
                  transformAlignment: Alignment.center,
                  child: const Center(
                    child: Text('Center',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
            ],
          ),
        )),

        SampleCaseWidget(SampleCase(
          id: 'TRN-012',
          title: 'transformAlignment with scale',
          description: 'Scale from different origins',
          status: SampleStatus.passing,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GlassContainer.clearGlass(
                height: 60,
                width: 80,
                transform: Matrix4.diagonal3Values(0.8, 0.8, 1),
                transformAlignment: Alignment.topLeft,
                child: const Center(
                  child: Text('TL',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              GlassContainer.clearGlass(
                height: 60,
                width: 80,
                transform: Matrix4.diagonal3Values(0.8, 0.8, 1),
                transformAlignment: Alignment.center,
                child: const Center(
                  child: Text('Center',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              GlassContainer.clearGlass(
                height: 60,
                width: 80,
                transform: Matrix4.diagonal3Values(0.8, 0.8, 1),
                transformAlignment: Alignment.bottomRight,
                child: const Center(
                  child: Text('BR',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
        )),

        const SizedBox(height: 32),
      ],
    );
  }
}
