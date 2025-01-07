import 'package:do_an/screens/fill_profile/widget/custom_button.dart';
import 'package:do_an/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../widget/success_dialog.dart'; // Import SuccessDialog

class FillProfileForm extends StatelessWidget {
  const FillProfileForm({Key? key}) : super(key: key);

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Không cho phép tắt dialog khi nhấn ngoài
      builder: (BuildContext context) {
        // Đóng dialog và điều hướng sau 1 giây
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context); // Đóng dialog
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()), // Đẩy đến HomePage
          );
        });
        return const SuccessDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFFBDBDBD),
                ),
              ),
              CircleAvatar(
                radius: 14,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 40),
          _buildTextField('First Name'),
          const SizedBox(height: 20),
          _buildTextField('Last Name'),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Continue',
            onPressed: () {
              _showSuccessDialog(context); // Hiển thị dialog và điều hướng sau đó
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: 'Mulish',
          color: Color(0xFF505050),
        ),
        prefixIcon: icon != null ? Icon(icon, color: const Color(0xFF505050)) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
