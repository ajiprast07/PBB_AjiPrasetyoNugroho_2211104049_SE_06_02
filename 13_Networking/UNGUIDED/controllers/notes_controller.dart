import 'package:get/get.dart';
import 'package:pertemuan_13/models/note_model.dart';
import 'package:uuid/uuid.dart';

class NotesController extends GetxController {
  RxList<Note> notes = <Note>[].obs;
  final uuid = Uuid();

  void addNote(String title, String description) {
    final newNote = Note(id: uuid.v4(), title: title, description: description);
    notes.add(newNote);
    notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  void deleteNote(String id) {
    notes.removeWhere((note) => note.id == id);
  }

  Note? getNoteById(String id) {
    return notes.firstWhereOrNull((note) => note.id == id);
  }
}
