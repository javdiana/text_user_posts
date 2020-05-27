import 'package:flutter/material.dart';
import 'package:fluttertestposts/src/model/comment.dart';
import 'package:fluttertestposts/src/resources/post_api.dart';

class ListComments extends StatefulWidget {
  int postId;

  ListComments(this.postId);

  State<StatefulWidget> createState() => ListCommentsState(postId);
}

class ListCommentsState extends State<ListComments> {
  int postId;
  List<Comment> _comments = new List();

  ListCommentsState(this.postId);

  @override
  initState() {
    super.initState();

    PostApi().fetchComments(postId).then((comments) => {
          setState(() {
            _comments = comments;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users posts'),
        ),
        body: ListView.builder(
          itemBuilder: _buildTile,
          itemCount: _comments.length,
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, int index) {
    return Column(
      children: [
        ListTile(
            title: Text(
              _comments[index].name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
            ),
            contentPadding: EdgeInsets.only(bottom: 4.0),
            subtitle: Text(
              _comments[index].body,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            )),
        Divider(
          height: 8.0,
          color: Colors.grey,
        ),
      ],
    );
  }
}
