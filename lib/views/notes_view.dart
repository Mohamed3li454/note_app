import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_add_note.dart';
import 'package:note_app/widgets/note_view_body.dart';

// ignore: camel_case_types
class notes_view extends StatelessWidget {
  const notes_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return const CustomAddNotes();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: const note_view_body(),
    );
  }
}
