import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromiseScreen extends StatefulWidget {
  const PromiseScreen({Key? key}) : super(key: key);

  @override
  State<PromiseScreen> createState() => _PromiseScreenState();
}

class _PromiseScreenState extends State<PromiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Promise Screen'),
        ),
        body: Container(
          width: 300,
          height: 200,
          alignment: Alignment.bottomRight,
          color: Colors.grey,
        ));
  }
}
