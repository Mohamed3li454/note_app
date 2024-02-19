// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(NotesInitial());
  Color color = const Color.fromARGB(255, 192, 115, 211);
  addnotes(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notebox = Hive.box<NoteModel>('notes_box');
      await notebox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailed(
        errorMassage: e.toString(),
      ));
    }
  }
}
