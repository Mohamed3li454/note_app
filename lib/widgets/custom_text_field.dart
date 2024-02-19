import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_TextFiald extends StatefulWidget {
  Custom_TextFiald(
      {super.key,
      required this.hint,
      this.maxlints = 1,
      this.onsaved,
      this.onchanged,
      this.text});
  final String hint;
  final int maxlints;
  final void Function(String?)? onsaved;
  final Function(String)? onchanged;
  String? text;

  @override
  State<Custom_TextFiald> createState() => _Custom_TextFialdState();
}

class _Custom_TextFialdState extends State<Custom_TextFiald> {
  // ignore: prefer_final_fields
  late TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    _textController = TextEditingController(text: widget.text);
    return TextFormField(
      controller: _textController,
      onChanged: widget.onchanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      maxLines: widget.maxlints,
      onSaved: widget.onsaved,
      decoration: InputDecoration(
        enabledBorder: buildBorder(),
        hintText: widget.hint,
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
