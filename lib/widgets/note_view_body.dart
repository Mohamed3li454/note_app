import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/notes_list_view.dart';

// ignore: camel_case_types
class note_view_body extends StatefulWidget {
  const note_view_body({super.key});

  @override
  State<note_view_body> createState() => _note_view_bodyState();
}

// ignore: camel_case_types
class _note_view_bodyState extends State<note_view_body> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).ReadNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          custom_appbar(title: "Notes", icon: Icons.mode_edit_outlined),
          Expanded(
            child: NotesListView(),
          )
        ],
      ),
    );
  }
}
