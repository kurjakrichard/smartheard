import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);
  final String title = 'Notes';

  @override
  State<StatefulWidget> createState() {
    return _NoteListState();
  }
}

class _NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getNoteListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
        },
        tooltip: 'Add note',
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
              leading: const CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text(
                'Dummy Title',
                style: titleStyle,
              ),
              trailing: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                debugPrint("ListTile clicked");
              },
            ),
          );
        });
  }
}
