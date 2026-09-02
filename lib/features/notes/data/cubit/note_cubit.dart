import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:p/features/notes/data/models/note_model.dart';
import 'package:p/features/notes/data/repo/notes_repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit({required this.repo}) : super(NoteInitial());
  final NotesRepo repo;
  StreamSubscription<List<NoteModel>>? _sub;

  /// Add
  Future<void> addNote(NoteModel note) async {
    try {
      await repo.addNote(note);
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  /// Delete
  Future<void> deleteNote(int noteId) async {
    try {
      await repo.deleteNote(noteId);
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

  /// Get / Watch
  Future<void> getNotes() async {
    await _sub?.cancel();
    emit(NoteLoading());
    _sub = repo.getAllNotes().listen(
      (event) => emit(NoteSuccess(notes: event)),
      onError: (e) => emit(NoteFailure(e.toString())),
    );
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }

  Future<void> toggleDone(int id, bool isDone) async {
    try {
      await repo.toggleDone(id, isDone);
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
