import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

void main() {
  runApp(GlassKitApp());
}

class GlassKitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child: Center(
          child: GlassContainer(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.height * 0.40,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.30),
                Colors.white.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment(0.80, 0.80),
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.60),
                Colors.white.withOpacity(0.10),
                Colors.grey.withOpacity(0.10),
                Colors.grey.withOpacity(0.60),
              ],
              begin: Alignment(0.2, 0.0),
              end: Alignment(1.0, 1.0),
              stops: [0.0, 0.39, 0.40, 1.0],
            ),
            isFrostedGlass: true,
            borderWidth: 1.5,
            elevation: 2.0,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
