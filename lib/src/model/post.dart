class Post{
  int id;
  String title;
  String body;
  int userId;

  Post.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        title = parsedJson['title'],
        body = parsedJson['body'],
        userId = parsedJson['userId'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'userId': userId
    };
  }
}
