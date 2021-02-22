import 'package:example/ios_home/glass_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

class IosHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: IosBody(),
      ),
    );
  }
}

class IosBody extends StatelessWidget {
  const IosBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          SizedBox(height: 40),
          GridView.count(
            mainAxisSpacing: 10.0,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              TimeWidget(),
              BatteryWidget(),
              CalendarWidget(),
              GoogleWidget(),
            ],
          ),
          SizedBox(height: 20.0),
          WeatherWidget()
        ],
      ),
    );
  }
}

class TimeWidget extends StatelessWidget {
  final textStyle = GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      height: MediaQuery.of(context).size.width * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quarter', style: textStyle),
          Text('Past', style: textStyle),
          Text('Four', style: textStyle),
        ],
      ),
    );
  }
}

class BatteryWidget extends StatelessWidget {
  final textStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 40.0,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      height: MediaQuery.of(context).size.width * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(
            FontAwesomeIcons.batteryQuarter,
            color: Colors.white,
            size: 40.0,
          ),
          Text('62%', style: textStyle),
        ],
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final textStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 40.0,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      height: MediaQuery.of(context).size.width * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5.0),
              Text(
                'FRIDAY',
                style: textStyle.copyWith(
                  fontSize: 12.0,
                  color: Color(0xff252550),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('28', style: textStyle),
            ],
          )
        ],
      ),
    );
  }
}

class GoogleWidget extends StatelessWidget {
  final textStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      height: MediaQuery.of(context).size.width * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.35),
                  Colors.white.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Image.asset('assets/google.png', width: 25.0)],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Search', style: textStyle),
              Text('Google', style: textStyle),
            ],
          )
        ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final textStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  final List<Weather> _timeWeatherList = [
    Weather(time: '7PM', iconData: FontAwesomeIcons.cloud, temp: '24°'),
    Weather(time: '8PM', iconData: FontAwesomeIcons.cloud, temp: '22°'),
    Weather(time: '9PM', iconData: FontAwesomeIcons.cloudMoon, temp: '21°'),
    Weather(time: '10PM', iconData: FontAwesomeIcons.solidMoon, temp: '21°'),
    Weather(time: '11PM', iconData: FontAwesomeIcons.solidMoon, temp: '20°'),
    Weather(time: '12PM', iconData: FontAwesomeIcons.solidMoon, temp: '19°'),
  ];

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      height: MediaQuery.of(context).size.width * 0.45,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kanpur', style: textStyle),
                  Text('24°', style: textStyle.copyWith(fontSize: 30)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Cloudy', style: textStyle.copyWith(fontSize: 12.0)),
                  Text('H:30° L:19°',
                      style: textStyle.copyWith(fontSize: 12.0)),
                  SizedBox(height: 5.0),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _timeWeatherList,
          ),
        ],
      ),
    );
  }
}

class Weather extends StatelessWidget {
  Weather({
    @required this.time,
    @required this.iconData,
    @required this.temp,
  });

  final String time;
  final IconData iconData;
  final String temp;

  final textStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(time, style: textStyle.copyWith(color: Color(0xff252550))),
        SizedBox(height: 10.0),
        FaIcon(
          iconData,
          color: Colors.white,
          size: 15.0,
        ),
        SizedBox(height: 10.0),
        Text(temp, style: textStyle),
      ],
    );
  }
}
