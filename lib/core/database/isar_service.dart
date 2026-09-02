import 'package:isar/isar.dart';
import 'package:p/features/notes/data/models/note_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([NoteModelSchema], directory: dir.path);
  }
}
