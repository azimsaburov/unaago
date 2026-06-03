import 'package:flutter/material.dart';
import 'package:unaago/core/constants/colors.dart';

/// Кастомная текстовая кнопка для приложения UnaaGo.
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsConstants.primary,
          foregroundColor: ColorsConstants.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: ColorsConstants.white)
            : Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

/// Кастомное текстовое поле.
class AppTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: ColorsConstants.white,
      ),
    );
  }
}
