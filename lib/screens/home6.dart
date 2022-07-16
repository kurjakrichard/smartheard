import 'package:flutter/material.dart';

class Home6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home6State();
  }
}

class _Home6State extends State<Home6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteKeeper'),
      ),
      body: const Center(
        child: Text('NoteKeeper'),
      ),
    );
  }
}
