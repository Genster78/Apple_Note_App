import 'package:apple_note_app/models/note.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatabase {
  // reference our hive box
  final _myBox = Hive.box('note_database');

  // load notes
  List<Note> loadNotes() {
    List<Note> saveNotesFormatted = [];

    // if there exists notes, return that, otherwise return empty list
    if (_myBox.get("All_Notes") != null) {
      List<dynamic> saveNotes = _myBox.get("All_Notes");

      for (int i = 0; i < saveNotes.length; i++) {
        // create individual note
        Note individualNote = Note(id: saveNotes[i][0], text: saveNotes[i][1]);
        // add to list
        saveNotesFormatted.add(individualNote);
      }
    } else {
      //default first note
      saveNotesFormatted.add(
        Note(id: 0, text: 'First Note'),
      );
    }

    return saveNotesFormatted;
  }

  // save noets
  void saveNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [
      /* 
      
      [
        [0, "First Note"],
        [1, "Second Note"],
      ]
      
      */
    ];

    // each note has an id and text
    for (var note in allNotes) {
      int id = note.id;
      String text = note.text;
      allNotesFormatted.add([id, text]);
    }

    // then store into hive
    _myBox.put("All_Notes", allNotesFormatted);
  }
}
