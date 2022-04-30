import 'package:flutter/material.dart';
import 'community_screen.dart';
import 'promise_screen.dart';
import 'package:provider/provider.dart';

import 'utils/drawing_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'watch_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PromiseScreen()
      home: ChangeNotifierProvider(
        create: (context) => DrawingProvider(),
        // child: CommunityScreen(),
        child: PromiseScreen(),
      ),
    );
  }
}
