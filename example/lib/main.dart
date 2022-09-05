import 'package:flutter/material.dart';
import 'package:gen_z_designs/component/gen_z_countdown.dart';
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
              onPressed: () {},
              text: "GenZdesign: Designs of new Generation.",
              type: GenZButtonType.OUTLINED,
            ),
            GenZCountdown(
              duration: Duration(
                milliseconds: DateTime.parse("2022-09-07 13:27:00")
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
