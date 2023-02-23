import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.obscureText,
      this.inputType})
      : super(key: key);

  final String? hintText;
  final Function(String)? onChanged;
  final bool? obscureText;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText!,
      keyboardType: inputType,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
