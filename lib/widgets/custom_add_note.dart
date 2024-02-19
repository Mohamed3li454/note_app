import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

class CustomAddNotes extends StatelessWidget {
  const CustomAddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
            if (state is AddNoteFailed) {}
            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).ReadNotes();
              Navigator.pop(context);
              AddNoteSuccessSnackbar.show(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: const SingleChildScrollView(
                child: FormBody(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddNoteSuccessSnackbar {
  static void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Note added successfully'),
          ],
        ),
        backgroundColor: Colors.black87,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
