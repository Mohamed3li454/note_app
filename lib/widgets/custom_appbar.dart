import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/widgets/custom_icon.dart';

// ignore: camel_case_types
class custom_appbar extends StatelessWidget {
  const custom_appbar(
      {super.key, required this.title, this.icon, this.onpressed});
  final String title;
  final IconData? icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.agdasima(
            textStyle: const TextStyle(fontSize: 32),
          ),
        ),
        const Spacer(),
        CustomIcon(
          onpressed: onpressed,
          icon: icon,
        )
      ],
    );
  }
}
