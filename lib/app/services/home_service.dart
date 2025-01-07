import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart';
import '../models/mentor.dart';

class HomeService {
  final String baseUrl = "http://10.0.2.2:8080/api/v1/home";

  Future<Map<String, dynamic>> fetchHomeData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes))['content'];
        final categories = List<String>.from(data['categories']);
        final courses = (data['courses'] as List)
            .map((course) => Course.fromJson(course))
            .toList();
        final mentors = (data['mentor'] as List)
            .map((mentor) => Mentor.fromJson(mentor))
            .toList();

        return {
          'categories': categories,
          'courses': courses,
          'mentors': mentors,
        };
      } else {
        throw Exception("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
