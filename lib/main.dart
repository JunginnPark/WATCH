import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'service/sync_firebase.dart';
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
        home: const SyncFB(),
      ),
    );
  }
}
