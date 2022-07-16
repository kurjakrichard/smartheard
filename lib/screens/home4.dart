import 'package:flutter/material.dart';

class Home4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home4State();
  }
}

class _Home4State extends State<Home4> {
  String _nameCity = '';
  String _nameCountry = '';
  final List<String> _currencies = ['Forint', 'Dollár', 'Euró', 'Egyéb'];
  String _currencyItemSelected = 'Forint';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful app example')),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  maxLength: 60,
                  onSubmitted: (String userInput) {
                    setState(() {
                      _nameCity = userInput;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text("Your best city is $_nameCity"),
                ),
                TextField(
                  maxLength: 60,
                  onSubmitted: (String userInput) {
                    setState(() {
                      _nameCountry = userInput;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text("Your best country is $_nameCountry"),
                ),
                DropdownButton<String>(
                  items: _currencies.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem));
                  }).toList(),
                  onChanged: (String? newValueSelected) {
                    setState(() {
                      _currencyItemSelected = newValueSelected!;
                    });
                  },
                  value: _currencyItemSelected,
                )
              ],
            )),
      ),
    );
  }
}
