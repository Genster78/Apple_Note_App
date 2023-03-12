import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
