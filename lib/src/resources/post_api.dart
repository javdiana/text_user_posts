import 'dart:convert';

import 'package:fluttertestposts/src/model/post.dart';
import 'package:fluttertestposts/src/model/comment.dart';
import 'package:http/http.dart';

class PostApi {
  static const _API_URL = 'https://jsonplaceholder.typicode.com';
  Client client = Client();

  Future<List<Post>> fetchPosts() async {
    final response = await client.get('$_API_URL/posts');
    return _getPosts(response.body);
  }

  List<Post> _getPosts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<List<Comment>> fetchComments(int id) async {
    final response = await client.get('$_API_URL/posts/$id/comments');
    return _getComments(response.body);
  }

  List<Comment> _getComments(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
  }
}
