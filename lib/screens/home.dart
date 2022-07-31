import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('clicked');
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: Column(
          children: [
            Row(
              children: [
                textWidget('Mumbai', 40),
                textWidget('Mumbai', 30),
              ],
            ),
            Row(
              children: [
                textWidget('Mumbai', 20),
                textWidget('Mumbaihkhk kkkjkjkgjfhd', 20),
              ],
            ),
            Image.asset('images/1.jpg', height: 250),
            Image.asset('images/2.jpg', height: 250),
            buttonWidget(context, 'Gomb', 20),
          ],
        ),
      ),
    );
  }

  Widget textWidget(String text, double size) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.yellow,
          fontFamily: 'Roboto',
          fontStyle: FontStyle.italic,
          fontSize: size,
        ),
      ),
    );
  }

  Widget buttonWidget(BuildContext context, String text, double size) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text('Have a good flight'),
                content: Text('Have a good flight'),
              );
            });
      },
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.deepOrange,
          fontFamily: 'Roboto',
          fontStyle: FontStyle.italic,
          fontSize: size,
        ),
      ),
    );
  }
}
