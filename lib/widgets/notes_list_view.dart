import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_card.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).Notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final NoteModel tmp = notes[oldIndex];
                notes.removeAt(oldIndex);
                notes.insert(newIndex, tmp);
              });
            },
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                key:
                    ValueKey(notes[index]), // Use ValueKey with the note object
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: custom_node_card(notes: notes[index]),
              );
            },
          ),
        );
      },
    );
  }
}
