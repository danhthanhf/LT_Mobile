import 'package:do_an/dto/auth_request.dart';
import 'package:do_an/service/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final request = AuthRequest.init().obs; // Khởi tạo một AuthRequest ban đầu
  final AuthService authService = AuthService();

  // Hàm xử lý đăng ký
  Future<void> register() async {
    try {
      bool result = await authService.register(request.value);
      if (result) {
        Get.snackbar('Success', 'Registration completed successfully');
      } else {
        Get.snackbar('Error', 'Registration failed');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Hàm xử lý đăng nhập
  Future<void> login(String email, String password) async {
    try {
      final response = await authService.login(email, password);
      if (response != null) {
        Get.snackbar('Success', 'Login successful');
        // Bạn có thể lưu token hoặc thông tin người dùng tại đây
        print("Login Response: $response");
      } else {
        Get.snackbar('Error', 'Invalid credentials');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
