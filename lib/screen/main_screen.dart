import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:watch_app/models/calendar.dart';

//import 'calendar_test_screen.dart';
//import 'community_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x3687D6), Color(0xFFFFFF)])),
      child: Scaffold(
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    height: valHeight * 0.3,
                  ),
                  Divider(
                    thickness: valHeight * 0.003,
                    indent: valWidth * 0.05,
                    endIndent: valWidth * 0.05,
                    color: Colors.black,
                  ),
                  Container(
                    height: valHeight * 0.4,
                  ),
                  CalendarModel()
                ],
              ))),
    );
  }
}
