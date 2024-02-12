import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/widgets/custom_search_Icon.dart';

// ignore: camel_case_types
class custom_appbar extends StatelessWidget {
  const custom_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Notes",
          style: GoogleFonts.agdasima(
            textStyle: const TextStyle(fontSize: 32),
          ),
        ),
        const Spacer(),
        const custom_searchIcon()
      ],
    );
  }
}
