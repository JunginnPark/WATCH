import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_app/screen/calendar_test_screen.dart';
import 'package:watch_app/screen/community_screen.dart';
import 'package:watch_app/screen/login_screen.dart';
import 'package:watch_app/screen/main_page.dart';
import 'package:watch_app/screen/promise_screen.dart';
import 'utils/drawing_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DrawingProvider()),
      ],
      child: MaterialApp(
        title: 'WatApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
