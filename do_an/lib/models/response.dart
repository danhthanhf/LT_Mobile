class ResponseModel {
  String? message;
  dynamic content;
  String status;

  ResponseModel({
    required this.message,
    required this.content,
    required this.status,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'],
      content: json['content'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'content': content,
      'status': status,
    };
  }
}