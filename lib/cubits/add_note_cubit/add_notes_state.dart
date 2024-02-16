part of 'add_notes_cubit.dart';

abstract class AddNotesState {
  const AddNotesState();
}

class NotesInitial extends AddNotesState {}

class AddNoteLoading extends AddNotesState {}

class AddNoteSuccess extends AddNotesState {}

class AddNoteFailed extends AddNotesState {
  final String errorMassage;

  AddNoteFailed({required this.errorMassage});
}
