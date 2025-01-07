import 'dart:convert';
import 'package:get/get.dart';
import 'package:mobile_app/app/models/course.dart';
import 'package:http/http.dart' as http;

class CourseService extends GetConnect {
  final String baseUrl = "http://10.0.2.2:8080/api/v1/public/courses";

  Future<List<Course>> fetchCourses() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/getAll'));
      print('Fetching courses with URL: $response');

      if (response.statusCode == 200) {
        final data = json.decode(
            utf8.decode(response.bodyBytes))['content']['content'] as List;

        return data.map((json) => Course.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load courses. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching courses: $e');
    }
  }

  Future<List<Course>> fetchFilteredCourses({
    String? title,
  }) async {
    try {
      final url = '$baseUrl/filter?title=$title';
      print('Fetching courses with URL: $url');

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(
            utf8.decode(response.bodyBytes))['content']['content'] as List;
        print('Fetched ${data.length} courses from the server');
        return data.map((json) => Course.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to fetch courses. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching filtered courses: $e');
      throw Exception('Error fetching filtered courses: $e');
    }
  }

}