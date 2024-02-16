import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_TextFiald extends StatelessWidget {
  const Custom_TextFiald(
      {super.key, required this.hint, this.maxlints = 1, this.onsaved});
  final String hint;
  final int maxlints;
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      maxLines: maxlints,
      onSaved: onsaved,
      decoration: InputDecoration(
        enabledBorder: buildBorder(),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.purple[200]),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
