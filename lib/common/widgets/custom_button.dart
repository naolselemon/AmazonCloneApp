import "package:amazon_clone/constants/global_variables.dart";
import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: GlobalVariables.secondaryColor,
            minimumSize: const Size(double.infinity, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          text,
          style: const TextStyle(color: GlobalVariables.backgroundColor),
        ));
  }
}
