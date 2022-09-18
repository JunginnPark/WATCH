import 'dart:ffi';

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
    final quitDay = 15; //금연 지속 날짜
    final Money = 4500 * quitDay; //절약 금액
    final lifeDay = 0.1 * quitDay; //절약 금액
    final thing = '에어팟 1.2개'; //절약 물품

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff3687d6), Color(0xffffffff)])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    height: valHeight * 0.29,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: valHeight * 0.06),
                              Row(
                                children: [
                                  SizedBox(
                                    width: valWidth * 0.05,
                                  ),
                                  Text(
                                    "우리가 함께한지",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: valHeight * 0.03,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: valWidth * 0.05,
                                    ),
                                    Text(
                                      '$quitDay',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: valWidth * 0.33,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' 일째',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: valHeight * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                            ],
                          ),
                          SizedBox(width: valWidth * 0.25),
                          Column(
                            children: [
                              SizedBox(height: valHeight * 0.06),
                              IconButton(
                                onPressed: null,
                                padding: const EdgeInsets.all(1.0),
                                icon: ImageIcon(
                                  const AssetImage("images/settings.png"),
                                  color: Colors.black,
                                  size: valWidth * 0.1,
                                ),
                              ),
                              IconButton(
                                onPressed: null,
                                padding: const EdgeInsets.all(1.0),
                                icon: ImageIcon(
                                  const AssetImage("images/comm.png"),
                                  color: Colors.black,
                                  size: valWidth * 0.1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: valWidth * 0.04,
                          )
                        ]),
                  ),
                  Divider(
                    thickness: valHeight * 0.003,
                    indent: valWidth * 0.05,
                    endIndent: valWidth * 0.05,
                    color: Colors.black,
                  ),
                  Container(
                    height: valHeight * 0.25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: valHeight * 0.15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: valWidth * 0.07,
                                      ),
                                      Text(
                                        "절약한 금액",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: valWidth * 0.07,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: valHeight * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: valWidth * 0.07,
                                      ),
                                      Text(
                                        "연장한 수명",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: valWidth * 0.07,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: valHeight * 0.15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "$Money 원",
                                        style: TextStyle(
                                            color: Color(0xffFEC226),
                                            fontSize: valWidth * 0.09,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: valWidth * 0.07,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: valHeight * 0.027,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "$lifeDay 일",
                                        style: TextStyle(
                                            color: Color(0xffFEC226),
                                            fontSize: valWidth * 0.09,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: valWidth * 0.07,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: valWidth * 0.07,
                                ),
                                Text(
                                  '금연한 이후로 지금까지',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: valWidth * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: valWidth * 0.07,
                                ),
                                Text(
                                  '$thing을 절약했어요!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: valWidth * 0.07,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  CalendarModel(),
                  SizedBox(
                    height: valHeight * 0.1,
                  ),
                ],
              ))),
    );
  }
}
