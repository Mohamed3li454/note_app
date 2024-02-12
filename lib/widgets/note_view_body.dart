import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar.dart';

// ignore: camel_case_types
class note_screen_body extends StatelessWidget {
  const note_screen_body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          custom_appbar(),
        ],
      ),
    );
  }
}
