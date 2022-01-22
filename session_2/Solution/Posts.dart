class Posts {
  // final int id;
  final String title;
  // final String body;

  // Posts({required this.id,required this.title,required this.body});
  Posts({required this.title});


  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      // id: json['id'],
      title: json['text'],
      // body: json['body'],
    );
  }
}