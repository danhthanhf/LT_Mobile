class Post {
  final int? id;
  final String? title;
  final String? body;
  final String? img;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.img,
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "body" : body,
    "base64Image" : img,
  };

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      img: json["base64Image"],
    );
  }
}