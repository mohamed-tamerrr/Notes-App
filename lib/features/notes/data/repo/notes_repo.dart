import 'dart:async';

import 'package:isar/isar.dart';
import 'package:p/features/notes/data/models/note_model.dart';

class NotesRepo {
  NotesRepo({required this.isar});
  final Isar isar;

  /// Add
  Future<void> addNote(NoteModel note) async {
    await isar.writeTxn(() async {
      await isar.noteModels.put(note);
    });
  }

  /// Delete
  Future<void> deleteNote(int noteId) async {
    await isar.writeTxn(() async {
      await isar.noteModels.delete(noteId);
    });
  }

  /// Get / Watch
  Stream<List<NoteModel>> getAllNotes() {
    return isar.noteModels.where().sortByDateDesc().watch(
      fireImmediately: true,
    );
  }

  Future<void> toggleDone(int id, bool isDone) async {
    await isar.writeTxn(() async {
      final note = await isar.noteModels.get(id);
      if (note != null) {
        note.isDone = isDone;
        await isar.noteModels.put(note);
      }
    });
  }
}
