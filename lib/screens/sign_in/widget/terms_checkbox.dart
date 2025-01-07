import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../forgot_password/forgot_password_screen.dart';

class TermsCheckbox extends StatefulWidget {
  final String label; // Nội dung hiển thị cho checkbox
  final RxBool isChecked; // Trạng thái được quản lý từ bên ngoài

  const TermsCheckbox({
    Key? key,
    required this.label,
    required this.isChecked,
  }) : super(key: key);

  @override
  _TermsCheckboxState createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(() => Checkbox(
              value: widget.isChecked.value,
              onChanged: (value) {
                widget.isChecked.value = value ?? false;
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            )),
            Text(
              widget.label,
              style: const TextStyle(
                color: Color(0xFF545454),
                fontSize: 13,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // Điều hướng đến màn hình Forgot Password
            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Color(0xFF0961F5),
              fontSize: 13,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
