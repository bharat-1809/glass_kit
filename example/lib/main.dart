import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

import 'comprehensive_samples/sample_home.dart';
import 'ios_home/ios_home.dart';
import 'card.dart';
import 'glass_card_list.dart';

void main() {
  runApp(const GlassKitApp());
}

class GlassKitApp extends StatelessWidget {
  const GlassKitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const NavigationHub(),
    );
  }
}

class NavigationHub extends StatelessWidget {
  const NavigationHub({super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Title
                const Text(
                  'GlassKit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Beautiful glassmorphism effects for Flutter',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),

                // Navigation Cards
                Expanded(
                  child: ListView(
                    children: [
                      _NavigationCard(
                        icon: Icons.science,
                        title: 'Comprehensive Samples',
                        subtitle: '8 categories • 113 sample cases',
                        isPrimary: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.withValues(alpha: 0.35),
                            Colors.blue.withValues(alpha: 0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        onTap: () =>
                            _navigateTo(context, const SampleHomePage()),
                      ),
                      const SizedBox(height: 16),
                      _NavigationCard(
                        icon: Icons.phone_iphone,
                        title: 'iOS Home',
                        subtitle: 'iOS-style home screen with widgets',
                        onTap: () => _navigateTo(context, IosHome()),
                      ),
                      const SizedBox(height: 12),
                      _NavigationCard(
                        icon: Icons.credit_card,
                        title: 'Bank Card',
                        subtitle: 'Frosted glass credit card design',
                        onTap: () => _navigateTo(context, BankCardPage()),
                      ),
                      const SizedBox(height: 12),
                      _NavigationCard(
                        icon: Icons.list_alt,
                        title: 'Glass Card List',
                        subtitle: 'ListView with glass containers',
                        onTap: () =>
                            _navigateTo(context, const GlassCardList()),
                      ),
                    ],
                  ),
                ),

                // Version badge
                Center(
                  child: GlassContainer.clearGlass(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    borderRadius: BorderRadius.circular(24),
                    child: const Text(
                      'v4.0.3-dev',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}

/// Navigation card widget
class _NavigationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isPrimary;
  final Gradient? gradient;

  const _NavigationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isPrimary = false,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isPrimary
          ? GlassContainer.frostedGlass(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              borderRadius: BorderRadius.circular(16),
              gradient: gradient,
              borderGradient: LinearGradient(
                colors: [
                  Colors.purple.withValues(alpha: 0.5),
                  Colors.blue.withValues(alpha: 0.3),
                ],
              ),
              child: _buildContent(),
            )
          : GlassContainer.clearGlass(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              borderRadius: BorderRadius.circular(16),
              child: _buildContent(),
            ),
    );
  }

  Widget _buildContent() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isPrimary
                ? Colors.white.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: isPrimary ? Colors.white : Colors.white70,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: isPrimary ? FontWeight.bold : FontWeight.w600,
                  fontSize: isPrimary ? 17 : 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white.withValues(alpha: 0.4),
          size: 16,
        ),
      ],
    );
  }
}
