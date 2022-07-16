import 'package:flutter/material.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bookpilot'),
      ),
      body: getListView(),
    );
  }

  Widget getListView() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.landscape),
          title: const Text("LandScape"),
          subtitle: const Text("Beautiful"),
          trailing: const Icon(Icons.wb_sunny),
          onTap: () {
            debugPrint('print');
          },
        ),
        ListTile(
          leading: const Icon(Icons.landscape),
          title: const Text("LandScape"),
          subtitle: const Text("Beautiful"),
          trailing: const Icon(Icons.wb_sunny),
          onTap: () {
            debugPrint('print2');
          },
        ),
        const Text("szöveg")
      ],
    );
  }
}
