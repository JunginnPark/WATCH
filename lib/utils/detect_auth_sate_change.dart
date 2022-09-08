import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screen/login_screen.dart';
import '../screen/main_page.dart';

class DetectAuthStateChange extends StatefulWidget {
  // 로그인 상태 변화를 감지
  const DetectAuthStateChange({Key? key}) : super(key: key);

  @override
  State<DetectAuthStateChange> createState() => _DetectAuthStateChangeState();
}

class _DetectAuthStateChangeState extends State<DetectAuthStateChange> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const MainPage();
          } else {
            return const LoginScreen();
          }
        });
  }
}
