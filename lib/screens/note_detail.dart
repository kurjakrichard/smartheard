import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/note.dart';
import '../utils/database_helper.dart';

enum Priorities { high, low }

class NoteDetail extends StatefulWidget {
  const NoteDetail(this.note, this.title, {Key? key}) : super(key: key);

  final String title;
  final Note note;

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState();
  }
}

class NoteDetailState extends State<NoteDetail> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  Priorities dropDownItemSelected = Priorities.low;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Note? note;

  @override
  Widget build(BuildContext context) {
    note = widget.note;
    debugPrint('A description ${note!.description}');
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1!;
    titleController.text = note!.title;
    descriptionController.text = note?.description ??= '';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton<Priorities>(
                value: getPriorityAsInt(note!.priority),
                items: Priorities.values.map((Priorities dropDownMenuItem) {
                  return DropdownMenuItem<Priorities>(
                    value: dropDownMenuItem,
                    child: Text(
                        '${dropDownMenuItem.name[0].toUpperCase()}${dropDownMenuItem.name.substring(1, dropDownMenuItem.name.length)}'),
                  );
                }).toList(),
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint('User selected $valueSelectedByUser');
                    updatePriorityAsInt(valueSelectedByUser!);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: titleController,
                onChanged: (value) {
                  debugPrint('Title változott');
                  updateTitle();
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: descriptionController,
                onChanged: (value) {
                  debugPrint('Description változott');
                  updateDescription();
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Save',
                        style: titleStyle,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint('Save button clicked!');
                          _saveData();
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Delete',
                        style: titleStyle,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint('Delete button clicked!');
                          _deleteData(note);
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert the String priority in the form of boolean before saving int to db
  void updatePriorityAsInt(Priorities value) {
    switch (value) {
      case Priorities.high:
        note!.priority = 1;
        break;
      case Priorities.low:
        note!.priority = 0;
        break;
    }
  }

  // Convert the boolean priority in the form of String to display in Dropdown menu
  Priorities getPriorityAsInt(int value) {
    Priorities? priority;
    switch (value) {
      case 1:
        priority = Priorities.high;
        break;
      case 0:
        priority = Priorities.low;
        break;
    }
    return priority!;
  }

  // Update the title of Note object
  void updateTitle() {
    note!.title = titleController.text;
  }

  // Update the description of Note object
  void updateDescription() {
    note!.description = descriptionController.text;
  }

  //Save data to database
  void _saveData() async {
    moveToLastScreen();
    note!.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note?.id != null) {
      result = await databaseHelper.updateNote(note!);
    } else {
      result = await databaseHelper.insertNote(note!);
    }

    if (result != 0) {
      //Success
      _showAlertDialog('Status', 'Note saved successfully');
    } else {
      //Failure
      _showAlertDialog('Status', 'Problem saving note');
    }
  }

  // AlertDialog for the database operation
  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void _deleteData(Note? note) async {
    moveToLastScreen();
    // Case 1 delete new note
    if (note!.id == null) {
      _showAlertDialog('Status', 'No note was deleted');
      return;
    }

    // Case 2 delete existing note
    int result = await databaseHelper.deleteNote(note.id);

    if (result != 0) {
      _showAlertDialog('Status', 'Note deleted successfully');
    } else {
      _showAlertDialog('Status', 'Error occured while deleting note');
    }
  }
}
