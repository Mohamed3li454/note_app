part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

class NoteSuccess extends NotesState {
  get notes => null;
}

class NotesLoaded extends NotesState {
  get notes => null;
}
