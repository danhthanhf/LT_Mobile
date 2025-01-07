import 'dart:convert';
import 'package:get/get.dart';
import 'package:mobile_app/app/models/course.dart';
import 'package:http/http.dart' as http;

class CourseService extends GetConnect {
  final String baseUrl = "http://10.0.2.2:8080/api/v1/public/courses/getAll";

  Future<List<Course>> fetchCourses() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes))['content']['content'] as List;

        return data.map((json) => Course.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load courses. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching courses: $e');
    }
  }
}
