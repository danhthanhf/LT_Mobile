import 'package:flutter/material.dart';

class TermsCheckbox extends StatefulWidget {
  const TermsCheckbox({Key? key}) : super(key: key);

  @override
  _TermsCheckboxState createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const Text(
          'Agree to Terms & Conditions',
          style: TextStyle(
            color: Color(0xFF545454),
            fontSize: 13,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
