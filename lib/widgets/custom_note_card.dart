import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

// ignore: camel_case_types
class custom_node_card extends StatelessWidget {
  const custom_node_card({super.key, required this.notes});
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditNoteView(note: notes),
          ),
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 17),
        // ignore: sort_child_properties_last
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                notes.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 7),
                child: Text(
                  notes.subtitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7), fontSize: 16),
                ),
              ),
              trailing: IconButton(
                  onPressed: () async {
                    final result = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text(
                            'This action will permanently delete this data'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );

                    if (result == null || !result) {
                      return;
                    }
                    notes.delete();
                    // ignore: use_build_context_synchronously
                    BlocProvider.of<NotesCubit>(context).ReadNotes();
                  },
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.black,
                    size: 32,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                notes.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 16),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
