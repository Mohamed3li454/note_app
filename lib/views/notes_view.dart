import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_view_body.dart';

// ignore: camel_case_types
class notes_page extends StatelessWidget {
  const notes_page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: note_screen_body(),
    );
  }
}
