import 'dart:convert';

import 'package:do_an/constant.dart';
import 'package:do_an/models/course.dart';
import 'package:do_an/models/response.dart';
import 'package:http/http.dart' as http;

class CourseService {

  Future<Course> fetchCourseByTitle(String title) async {
    final url = Uri.parse('${AppConstants.baseUrl}/public/courses?title=$title');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        ResponseModel responseModel = ResponseModel.fromJson(data);
        return Course.fromJson(responseModel.content);
      } else {
        throw Exception('Failed to load course');
      }
    } catch(e) {
      print("Error: ${e}");
      throw Exception('Failed to load course $e');
    }
  }
}