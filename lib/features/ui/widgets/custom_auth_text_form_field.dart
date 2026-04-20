import 'package:flutter/material.dart';

import '../../../core/spacing/spacing.dart';
import '../../../core/themes/my_colors.dart';
import '../../../core/themes/my_fonts.dart';

class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({super.key, required this.label, required this.hintText, required this.controller});
  final String label;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: MyFonts.font16greyfaded,
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyFonts.font16greyfaded,
            fillColor: MyColors.fadedBlueColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.primaryColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.primaryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.primaryColor)),
          ),
        )
      ],
    );;
  }
}
