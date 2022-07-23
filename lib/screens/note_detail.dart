import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names
enum Priorities { High, Low }

class NoteDetail extends StatefulWidget {
  const NoteDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState();
  }
}

class NoteDetailState extends State<NoteDetail> {
  var dropDownItemSelected;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dropDownItemSelected = Priorities.Low;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit note'),
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
                    child: Text(dropDownMenuItem.name),
                  );
                }).toList(),
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    dropDownItemSelected = valueSelectedByUser;
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
                      child: const Text('Save'),
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
                      child: const Text('Delete'),
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
