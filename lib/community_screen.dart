import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community screen'),
      ),
      body: Container(
        width: 300,
        height: 200,
        alignment: Alignment.bottomRight,
        color: Colors.grey,
      ),
    );
  }
}
