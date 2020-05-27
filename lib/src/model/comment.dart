class Comment{
  var postId;
  int id;
  String name;
  String email;
  String body;

  Comment.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        postId = parsedJson['id'],
        name = parsedJson['name'],
        body = parsedJson['body'],
        email = parsedJson['email'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'postId': postId,
      'name': name,
      'body': body,
      'email': email
    };
  }
}
