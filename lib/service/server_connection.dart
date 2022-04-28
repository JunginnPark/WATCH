import 'dart:convert';
import 'package:http/http.dart' as http;

class ServerConnection {
  static String serverUrl() {
    return "http://kaistuser.iptime.org:8080/team_watch/";
  }

  static Future<Map<String, dynamic>> getCommunityList() async {
    final response =
        await http.get(Uri.parse(serverUrl() + "get_community_list"));
    return (json.decode(response.body));
  }

  static Future<Map<String, dynamic>> getCommunityComment(
      {required String commentId}) async {
    final response = await http.get(
        Uri.parse(serverUrl() + "get_comment" + "?comment_id=" + commentId));
    return (json.decode(response.body));
  }

  static Future<String> createNewCommunity(
      {required String title,
      required String content,
      required String writer}) async {
    final response = await http.get(Uri.parse(serverUrl() +
        "create_community" +
        "?title=" +
        title +
        "&content=" +
        content +
        "&writer=" +
        writer));
    return (json.decode(response.body));
  }

  static Future<String> writeComment(
      {required String community_number,
      required String content,
      required String parent_comment,
      required String writer}) async {
    final response = await http.get(Uri.parse(serverUrl() +
        "write_comment" +
        "?community_number=" +
        community_number +
        "&content=" +
        content +
        "&parent_comment=" +
        parent_comment +
        "&writer=" +
        writer));
    return (json.decode(response.body));
  }
}
