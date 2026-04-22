import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.isLoading});

  final String text;
  final VoidCallback onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed:onTap, child: Text(text)));
  }
}
