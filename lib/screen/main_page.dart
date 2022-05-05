import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/screen/promise_screen.dart';

import 'calendar_test_screen.dart';
import 'community_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PromiseScreen()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Promise Screen',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CommunityScreen()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Community Screen',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CalendarTestScreen()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.pink,
              child: const Center(
                child: Text(
                  'Calendar Screen',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            // height: 50,
            color: Colors.cyan,
            child: Center(
              child: Text(
                "uid : ${currentUser!.uid} \n name : ${currentUser.displayName} \n email : ${currentUser.email!}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.yellow,
              child: const Center(
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
