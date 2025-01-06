import 'dart:convert';

import 'package:do_an/constant.dart';
import 'package:do_an/models/course.dart';
import 'package:do_an/models/response.dart';
import 'package:do_an/models/user_course_progress.dart';
import 'package:http/http.dart' as http;

class UserCourseService {
  final token = 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MzYxMzI4NzksInN1YiI6ImFkbWluQGdtYWlsLmNvbSIsImlhdCI6MTczNjA5Njg3OX0.qtkw423kSISJHTtWjSUoXGJ9ytp4wKotV_UFhp07vwI';

  Future<List<UserCourseProgress>> fetchMyCourse() async {
    final uri = Uri.parse('${AppConstants.baseUrl}/me/courses/enrolled');
    final headers = {
      'Authorization' : 'Bearer $token',
    };

    try {
      final res = await http.get(uri, headers: headers);
      if(res.statusCode == 200) {
        final data = jsonDecode(res.body);
        ResponseModel responseModel = ResponseModel.fromJson(data);
        List<UserCourseProgress> userCourseProgressList = responseModel.content.map<UserCourseProgress>((e) => UserCourseProgress.fromJson(e)).toList();
        return userCourseProgressList;
      }
      else {
        throw Exception('Failed to load course');
      }
    } catch(e) {
      print("Error: $e");
      throw Exception('Failed to load course $e');
    }
  }
}