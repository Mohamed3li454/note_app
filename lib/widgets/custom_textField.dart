import 'package:flutter/material.dart';

class Custom_TextFiald extends StatelessWidget {
  const Custom_TextFiald({super.key, required this.hint, this.maxlints = 1});
  final String hint;
  final int maxlints;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlints,
      onSubmitted: (value) {},
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
