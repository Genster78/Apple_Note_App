import 'package:apple_note_app/models/note.dart';
import 'package:apple_note_app/models/note_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'editing_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // createnew note
  void createNewNote() {
    // create a new id
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;

    //create a blank note
    Note newNote = Note(
      id: id,
      text: '',
    );

    //go to edit the note
    goToNotePage(newNote, true);
  }

  //go to note editing page
  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditingNotePage(
          note: note,
          isNewNote: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          elevation: 0,
          backgroundColor: Colors.grey.shade300,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 75),
              child: Text(
                'Notes',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // list of notes
            CupertinoListSection.insetGrouped(
              children: List.generate(
                value.getAllNotes().length,
                (index) => CupertinoListTile(
                  title: Text(value.getAllNotes()[index].text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
