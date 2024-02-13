import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_note_card.dart';

// ignore: camel_case_types
class note_view_body extends StatelessWidget {
  const note_view_body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          custom_appbar(),
          custom_node_card()
        ],
      ),
    );
  }
}
