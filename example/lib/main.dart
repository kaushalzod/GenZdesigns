import 'package:flutter/material.dart';
import 'package:gen_z_designs/gen_z_designs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenZButton(
              badge: true,
              onPressed: () {},
              type: GenZButtonType.OUTLINED,
              badgeColor: Colors.amber,
              badgePosition: const BadgePosition(left: 0),
              badgeType: BadgeType.INSIDE,
              badgeText: const Icon(Icons.abc, size: 18),
              text: "Text Button",
            ),
            GenZCountdown(
              // Sale Time is 2022-12-22 at 12:00 PM
              duration: Duration(
                milliseconds: DateTime.parse("2022-12-22 12:00:00")
                    .difference(DateTime.now())
                    .inMilliseconds,
              ),
            )
          ],
        ),
      ),
    );
  }
}
