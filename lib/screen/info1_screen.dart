import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Info1Screen extends StatefulWidget {
  const Info1Screen({Key? key}) : super(key: key);

  @override
  State<Info1Screen> createState() => _Info1ScreenState();
}

class _Info1ScreenState extends State<Info1Screen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Color(0xff3687D6), Color(0xffffffff)])),
      child: Scaffold(
        body: Column(children: [
          Text(),
        ]),
      ),
    );
  }
}
