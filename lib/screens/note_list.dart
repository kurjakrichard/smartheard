import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'note_detail.dart';
import '../utils/database_helper.dart';
import '../models/note.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);
  final String title = 'Notes';

  @override
  State<StatefulWidget> createState() {
    return _NoteListState();
  }
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  int count = 0;
  List<Note>? noteList;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = <Note>[];
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getNoteListView(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add note',
        onPressed: () {
          debugPrint('Add item clicked');
          navigatetoDetail(Note('', '', 0, ''), 'Add note');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1!;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        getPriorityColor(noteList![position].priority),
                    child: getPriorityIcon(noteList![position].priority),
                  ),
                  title: Text(
                    noteList![position].title,
                    style: titleStyle,
                  ),
                  subtitle: Text(noteList![position].date),
                  trailing: GestureDetector(
                    child: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      _delete(context, noteList![position]);
                    },
                  ),
                  onTap: () {
                    debugPrint('Delete icon clicked');
                    navigatetoDetail(noteList![position], 'Edit note');
                  }));
        });
  }

  void navigatetoDetail(Note note, String title) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NoteDetail(note, title);
        },
      ),
    );

    if (result == true) {
      updateListView();
    }
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 0:
        return Colors.yellow;
      default:
        return Colors.yellow;
    }
  }

  // Returns the priority
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return const Icon(Icons.play_arrow);
      case 0:
        return const Icon(Icons.keyboard_arrow_right);
      default:
        return const Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note deleted successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessengerState().showSnackBar(SnackBar(content: Text(message)));
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initialDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          count = noteList.length;
        });
      });
    });
  }
}
