import 'package:flutter/material.dart';

enum Priorities { high, low }

class NoteDetail extends StatefulWidget {
  const NoteDetail(this.title, {Key? key}) : super(key: key);

 final String title;

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState();
  }
}

class NoteDetailState extends State<NoteDetail> {
  Priorities dropDownItemSelected = Priorities.low;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1!;

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
                value: dropDownItemSelected,
                items: Priorities.values.map((Priorities dropDownMenuItem) {
                  return DropdownMenuItem<Priorities>(
                    value: dropDownMenuItem,
                    child: Text(
                        '${dropDownMenuItem.name[0].toUpperCase()}${dropDownMenuItem.name.substring(1, dropDownMenuItem.name.length)}'),
                  );
                }).toList(),
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    dropDownItemSelected = valueSelectedByUser!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: titleController,
                onChanged: (value) {
                  debugPrint('Valami változott');
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
                  debugPrint('Valami változott');
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
}
