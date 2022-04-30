import 'package:flutter/material.dart';
import 'package:watch_app/service/server_connection.dart';

import 'comment_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: ServerConnection.getCommunityList(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        print("debug : ${snapshot.data}");
        return Scaffold(
          appBar: AppBar(
            title: Text('Community screen'),
          ),
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommentScreen()),
                  );
                },
                child: Container(
                  width: 300,
                  height: 200,
                  alignment: Alignment.bottomRight,
                  color: Colors.grey,
                  child: Text("${snapshot.data}"),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var result = await ServerConnection.createNewCommunity(
                      title: 'title_test',
                      content: 'content_test',
                      writer: 'writer_test');
                  print(result);
                },
                child: Container(
                  width: 300,
                  height: 200,
                  alignment: Alignment.bottomRight,
                  color: Colors.red,
                  child: Text("new community"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
