import 'package:apple_note_app/data/hive_database.dart';
import 'package:flutter/cupertino.dart';

import 'note.dart';

class NoteData extends ChangeNotifier {
  // hive database
  final db = HiveDatabase();


  // overall list of notes
  List<Note> allNotes = [
  ];

  // initialize list
  void initializeNotes() {
    allNotes = db.loadNotes();
  }

  //get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

  // add a new note
  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  //update note
  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      // finds the relevant note
      if (allNotes[i].id == note.id) {
        // replace text
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  // delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}
