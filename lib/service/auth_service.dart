import 'package:do_an/constants.dart';
import 'package:do_an/dto/auth_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  // Đăng ký người dùng
  Future<bool> register(AuthRequest request) async {
    final uri = Uri.parse('${AppConstant.baseUri}/auth/register');
    try {
      final result = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()), // Convert request to JSON
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        return true;
      } else {
        print("Lỗi đăng ký: ${result.body}");
        return false;
      }
    } catch (e) {
      print("Lỗi đăng ký: $e");
      return false;
    }
  }

  // Đăng nhập người dùng
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final uri = Uri.parse('${AppConstant.baseUri}/auth/login');
    try {
      final result = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (result.statusCode == 200) {
        final data = jsonDecode(result.body);
        return data; // Trả về dữ liệu phản hồi từ server
      } else {
        print("Lỗi đăng nhập: ${result.body}");
        return null;
      }
    } catch (e) {
      print("Lỗi đăng nhập: $e");
      return null;
    }
  }
}
