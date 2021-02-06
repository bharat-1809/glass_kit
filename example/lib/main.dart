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
  GlassContainer createModifiedCircleGlassContainer() {
    return GlassContainer(
      height: 325,
      width: 400,
      gradient: LinearGradient(
        colors: [
          Colors.lightGreen.withOpacity(0.40),
          Colors.lightGreen.withOpacity(0.10),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.lightBlue.withOpacity(0.60),
          Colors.lightBlue.withOpacity(0.10),
          Colors.lightBlueAccent.withOpacity(0.05),
          Colors.lightBlueAccent.withOpacity(0.60),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.39, 0.40, 1.0],
      ),
      blur: 20,
      shape: BoxShape.circle,
      borderWidth: 1.5,
      elevation: 3.0,
      isFrostedGlass: true,
      shadowColor: Colors.lightGreenAccent.withOpacity(0.20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_2.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.black54,
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 2.0)),
            child: GlassContainer(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              // transform: Matrix4.rotationZ(-3.14 / 4),
              // constraints: BoxConstraints(
              //   minHeight: MediaQuery.of(context).size.height * 0.8,
              //   minWidth: MediaQuery.of(context).size.height * 0.9,
              // ),
              // transformAlignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.height * 0.40,
              color: Colors.white.withOpacity(0.80),
              // gradient: LinearGradient(
              //   colors: [
              //     Colors.lightBlueAccent.withOpacity(0.40),
              //     Colors.blueAccent.withOpacity(0.10),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment(0.80, 0.80),
              // ),
              borderGradient: LinearGradient(
                colors: [
                  // Colors.blueAccent.withOpacity(0.60),
                  Colors.lightBlueAccent.withOpacity(0.40),
                  Colors.lightBlueAccent.withOpacity(0.0),
                  Colors.greenAccent.withOpacity(0.10),
                  Colors.greenAccent.withOpacity(0.60),
                ],
                begin: Alignment(0.0, 0.0),
                end: Alignment(1.0, 1.0),
                stops: [0.0, 0.40, 0.40, 1.0],
              ),
              // borderColor: Colors.blue,
              borderWidth: 2,
              isFrostedGlass: true,
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
