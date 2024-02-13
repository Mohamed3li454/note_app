import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/views/notes_view.dart';

void main() {
  runApp(const note_app());
}

// ignore: camel_case_types
class note_app extends StatelessWidget {
  const note_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: ),
      home: const notes_view(),
    );
  }
}
