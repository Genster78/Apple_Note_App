import 'package:apple_note_app/models/note_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;

  EditingNotePage({
    super.key,
    required this.isNewNote,
    required this.note,
  });

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }

  //load existibng note
  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  // add new note
  void addNewNote() {
    // get new id
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    // get text from editor
    String text = _controller.document.toPlainText();

    // add the new note
    Provider.of<NoteData>(context, listen: false)
        .addNewNote(Note(id: id, text: text));
  }

  // update existing note
  void updateNote() {
    //get text from editor
    String text = _controller.document.toPlainText();

    // update note
    Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.2),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // it's a new note
            if (widget.isNewNote && !_controller.document.isEmpty()) {
              addNewNote();
            }

            // it's existing note
            else {
              updateNote();
            }
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          //tool bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Center(
              child: QuillToolbar.basic(
                controller: _controller,
                showAlignmentButtons: true,
                showBackgroundColorButton: false,
                showColorButton: false,
                showCodeBlock: false,
                showDirection: true,
                showFontFamily: false,
                showDividers: true,
                showBoldButton: true,
                showClearFormat: false,
                showFontSize: true,
                showHeaderStyle: true,
                showIndent: false,
                showInlineCode: false,
                showItalicButton: true,
                showLink: false,
                showListBullets: true,
                showListCheck: true,
                showListNumbers: true,
                showQuote: false,
                showSearchButton: false,
                showSmallButton: false,
                showStrikeThrough: false,
                showUnderLineButton: true,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: QuillEditor.basic(
                controller: _controller,
                readOnly: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
