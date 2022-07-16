import 'package:flutter/material.dart';

class Home3 extends StatelessWidget {
  const Home3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('bookpilot'),
      ),
      body: getListView(context),
    );
  }

  Widget getListView(BuildContext context) {
    var items = List<String>.generate(1000, (index) => "Item $index");

    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.arrow_back),
            title: Text(items[index]),
            onTap: () {
              var snackBar = const SnackBar(
                content: Text('Ez egy snackbar'),
              );
              Scaffold.of(context).showSnackBar(snackBar);
              debugPrint('${items[index]} was tapped');
            },
          );
        });
  }
}
