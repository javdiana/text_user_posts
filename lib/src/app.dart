import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertestposts/src/screen/list_comments.dart';
import 'package:fluttertestposts/src/screen/list_posts.dart';

class App extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts',
      theme: ThemeData.dark(),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    if(settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return ListPost();
        },
      );
    }
    else {
      return MaterialPageRoute(
        builder: (context) {
          final postId = int.parse(settings.name.replaceFirst('/', ''));
          return ListComments(postId);
        }
      );
    }
  }
}