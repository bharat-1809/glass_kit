import 'package:example/ios_home/glass_widget.dart';
import 'package:flutter/material.dart';

class GlassCardList extends StatelessWidget {
  const GlassCardList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/bg_1.jpg'),
          ),
        ),
        child: SafeArea(
          child: ListView.separated(
            itemCount: 50,
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 102,
                child: GlassWidget(
                  child: ListTile(
                    title: Text('Item $index'),
                    leading: Icon(Icons.ac_unit),
                    subtitle: Text('Subtitle $index'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
