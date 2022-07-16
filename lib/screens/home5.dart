import 'package:flutter/material.dart';

class Home5 extends StatefulWidget {
  const Home5({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home5State();
  }
}

class _Home5State extends State<Home5> {
  final List<String> _currencies = ['Forint', 'Dollár', 'Euró', 'Egyéb'];
  String? _currencyItemSelected;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _currencyItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String _displayResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            picture('images/3.jpg'),
            inputTextField('Principal', 'Enter Principal e.g. 12.000',
                principalController),
            inputTextField('Rate of Interest', 'In percent', roiController),
            Row(
              children: [
                Expanded(
                    child: inputTextField(
                        'Term', 'Time in years', termController)),
                Container(width: 20),
                dropDown(_currencies)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  button('Calculate', calculateTotalReturn),
                  Container(width: 20),
                  button('Reset', reset),
                ],
              ),
            ),
            Center(child: Text(_displayResult)),
          ],
        ),
      ),
    );
  }

  Widget button(String buttonText, Function buttonAction) {
    return Expanded(
        child: ElevatedButton(
      child: Text(buttonText),
      onPressed: () {
        setState(() {
          if (buttonText == 'Calculate') {
            if (_formKey.currentState!.validate()) {
              _displayResult = buttonAction();
            }
          } else {
            reset();
          }
        });
      },
    ));
  }

  Widget dropDown(List<String> list) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: DropdownButton(
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValueSelected) {
            setState(() {
              _currencyItemSelected = newValueSelected!;
            });
          },
          value: _currencyItemSelected,
        ),
      ),
    );
  }

  Widget picture(String path) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(path, height: 250),
    );
  }

  Widget inputTextField(
      String labelText, String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter number';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
            errorStyle:
                const TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }

  String calculateTotalReturn() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    return 'After $term years, your investment will be worth $totalAmountPayable $_currencyItemSelected.';
  }

  void reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    _displayResult = '';
    _currencyItemSelected = _currencies[0];
  }
}
