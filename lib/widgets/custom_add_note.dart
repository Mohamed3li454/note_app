import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_add_button.dart';
import 'package:note_app/widgets/custom_textField.dart';

class CustomAddNotes extends StatelessWidget {
  const CustomAddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            Custom_TextFiald(hint: "Title"),
            SizedBox(
              height: 16,
            ),
            Custom_TextFiald(
              hint: "Content",
              maxlints: 5,
            ),
            SizedBox(
              height: 32,
            ),
            CustomAddButton(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
