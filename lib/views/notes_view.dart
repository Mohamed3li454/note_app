import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_view_body.dart';

// ignore: camel_case_types
class notes_view extends StatelessWidget {
  const notes_view({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: note_view_body(),
    );
  }
}
