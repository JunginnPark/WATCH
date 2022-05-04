import 'package:flutter/material.dart';
import 'package:watch_app/service/server_connection.dart';

class CommentScreen extends StatefulWidget {
  // Server에서 comment 불러와서 보여주는 화면
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreen();
}

class _CommentScreen extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: ServerConnection.getCommunityComment(commentId: '1'),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        print("debug : ${snapshot.data}");
        return Scaffold(
          appBar: AppBar(
            title: Text('Comment screen'),
          ),
          body: Column(
            children: [
              Container(
                width: 300,
                height: 200,
                alignment: Alignment.bottomRight,
                color: Colors.grey,
                child: Text("${snapshot.data}"),
              ),
              GestureDetector(
                onTap: () async {
                  var result = await ServerConnection.writeComment(
                    community_number: '1',
                    content: 'content_test',
                    parent_comment: '0',
                    writer: 'writer_test',
                  );
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
