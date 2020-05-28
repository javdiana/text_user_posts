import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertestposts/src/screen/list_comments.dart';
import 'package:fluttertestposts/src/screen/list_posts.dart';

class App extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts',
      theme: ThemeData.dark(),
      home: ListPost(),
    );
  }

  Route routes(RouteSettings settings) {
    if(settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => ListPost(),
      );
    }
  }
}