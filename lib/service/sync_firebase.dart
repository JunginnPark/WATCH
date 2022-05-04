import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../utils/detect_auth_sate_change.dart';

class SyncFB extends StatelessWidget {
  // Firebase 연동
  const SyncFB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Firebase load fail"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const DetectAuthStateChange();
        }
        return Material(
          type: MaterialType.transparency,
          child: Container(
            color: const Color(0xff0B202A),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "앱 로딩중....",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
