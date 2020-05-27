import 'package:flutter/material.dart';
import 'package:fluttertestposts/src/model/post.dart';
import 'package:fluttertestposts/src/resources/post_api.dart';

class ListPost extends StatefulWidget {
  State<StatefulWidget> createState() => ListPostState();
}

class ListPostState extends State<ListPost> {
  List<Post> _posts = new List();

  @override
  initState() {
    super.initState();

    PostApi().fetchPosts().then((posts) => {
          setState(() => {
            _posts = posts,
          })
        });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users posts'),
        ),
        body: ListView.builder(
          itemBuilder: _buildTile,
          itemCount: _posts.length,
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, int index) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/${_posts[index].id}');
          },
          title: Text(
              _posts[index].title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
          contentPadding: EdgeInsets.only(bottom: 4.0),
          subtitle: Text(_posts[index].body,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700),),
        ),
        Divider(
          height: 8.0,
          color: Colors.grey,
        ),
      ],
    );
  }
}
