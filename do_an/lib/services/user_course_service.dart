import 'dart:convert';

import 'package:do_an/constant.dart';
import 'package:do_an/models/course.dart';
import 'package:do_an/models/response.dart';
import 'package:do_an/models/user_course_progress.dart';
import 'package:http/http.dart' as http;

class UserCourseService {

  final userCourseUri = Uri.parse('${AppConstants.baseUrl}/me/courses/enrolled');


  Future<List<UserCourseProgress>> fetchMyCourse(bool isCompleted, String title) async {
    final uri = Uri.parse('$userCourseUri/filter?isCompleted=$isCompleted&title=asda');
    final headers = {
      'Authorization' : 'Bearer ${AppConstants.token}',
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
        throw Exception('Failed to load course ${res.statusCode}');
      }
    } catch(e) {
      print("Error: $e");
      throw Exception('Failed to load course $e');
    }
  }
}