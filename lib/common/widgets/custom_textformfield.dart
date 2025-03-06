import "package:amazon_clone/constants/global_variables.dart";
import "package:flutter/material.dart";

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield(
      {super.key, required this.controller, required this.text});

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: GlobalVariables.secondaryColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your $text";
        }
        return null;
      },
    );
  }
}
