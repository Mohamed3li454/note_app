// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  // ignore: non_constant_identifier_names
  List<NoteModel>? Notes;
  // ignore: non_constant_identifier_names
  ReadNotes() {
    var notebox = Hive.box<NoteModel>('notes_box');
    Notes = notebox.values.toList();
    emit(NoteSuccess());
  }
}
