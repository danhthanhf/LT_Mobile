import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          ProfileFormField(
            label: 'First Name',
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          ProfileFormField(
            label: 'Last Name',
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          ProfileFormField(
            label: 'Date of Birth',
            prefixIcon: 'assets/images/calendar_icon.png',
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          ProfileFormField(
            label: 'Email',
            prefixIcon: 'assets/images/email_icon.png',
            onChanged: (value) {},
          ),
          const SizedBox(height: 111),
          ProfileFormField(
            label: 'Student',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class ProfileFormField extends StatelessWidget {
  final String label;
  final String? prefixIcon;
  final ValueChanged<String> onChanged;

  const ProfileFormField({
    Key? key,
    required this.label,
    this.prefixIcon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon != null
              ? Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              prefixIcon!,
              width: 18,
              height: 18,
            ),
          )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 21,
          ),
        ),
      ),
    );
  }
}
