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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GlassContainer(
            height: 200,
            width: 350,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.40),
                Colors.white.withOpacity(0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.60),
                Colors.white.withOpacity(0.10),
                Colors.lightGreenAccent.withOpacity(0.05),
                Colors.lightGreenAccent.withOpacity(0.60),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.39, 0.40, 1.0],
            ),
            blur: 20,
            borderRadius: BorderRadius.circular(24.0),
            borderWidth: 1.0,
            elevation: 3.0,
            isFrostedGlass: true,
            shadowColor: Colors.lightGreen.withOpacity(0.20),
          ),
        ),
      ),
    );
  }
}
