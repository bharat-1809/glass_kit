import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class BankCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black.withValues(alpha: 0.90),
        child: BankCard(),
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 350,
        child: GlassContainer.frostedGlass(
          borderRadius: BorderRadius.circular(25.0),
          borderWidth: 1.5,
          blur: 15.0,
          frostedOpacity: 0.06,
          gradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: 0.40),
              Colors.white.withValues(alpha: 0.06),
            ],
            begin: Alignment(-0.10, -1.0),
            end: Alignment(0.00, 1.0),
          ),
          borderGradient: LinearGradient(
              colors: [
                Colors.white.withValues(alpha: 0.70),
                Colors.white.withValues(alpha: 0.0),
                Colors.grey.withValues(alpha: 0.0),
                Colors.grey.withValues(alpha: 0.60),
              ],
              begin: Alignment(0.35, -1.0),
              end: Alignment.bottomRight,
              stops: [0.0, 0.30, 0.31, 1.0]
              // stops: []
              ),
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
          elevation: 5.0,
          child: CardChild(),
        ),
      ),
    );
  }
}

class CardChild extends StatelessWidget {
  final textStyle = GoogleFonts.sourceCodePro(
    color: Colors.white60,
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.fiveHundredPx,
              color: Colors.white60,
              size: 32.0,
            ),
            Text('DART BANK', style: textStyle),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5022 3386 9820 1246',
              style: textStyle.copyWith(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('BHARAT SHARMA', style: textStyle),
                Text(
                  '01/23',
                  style: textStyle.copyWith(
                      fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
