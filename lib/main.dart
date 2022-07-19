import 'package:flutter/material.dart';
/*import 'screens/home.dart';
import 'screens/home2.dart';
import 'screens/home3.dart';
import 'screens/home4.dart';
import 'screens/home5.dart';*/
import 'screens/note_list.dart';
import 'screens/home3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Exporing UI widgets',
        theme: ThemeData(
            brightness: Brightness.light,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo, onPrimary: Colors.white)),
            appBarTheme: const AppBarTheme(color: Colors.indigo)),
        home: NoteList());
  }
}
