import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String _inputValue = '';
  String _convertedValue = '';
  String _selectedType = 'Binary';

  void _convertValues() {
    try {
      if (_selectedType == 'Binary') {
        int decimalValue = int.parse(_inputValue, radix: 2);
        _convertedValue =
            'Decimal: $decimalValue\nOctal: ${decimalValue.toRadixString(8)}\nHexadecimal: ${decimalValue.toRadixString(16).toUpperCase()}';
      } else if (_selectedType == 'Decimal') {
        int decimalValue = int.parse(_inputValue);
        _convertedValue =
            'Binary: ${decimalValue.toRadixString(2)}\nOctal: ${decimalValue.toRadixString(8)}\nHexadecimal: ${decimalValue.toRadixString(16).toUpperCase()}';
      } else if (_selectedType == 'Octal') {
        int decimalValue = int.parse(_inputValue, radix: 8);
        _convertedValue =
            'Binary: ${decimalValue.toRadixString(2)}\nDecimal: $decimalValue\nHexadecimal: ${decimalValue.toRadixString(16).toUpperCase()}';
      } else if (_selectedType == 'Hexadecimal') {
        int decimalValue = int.parse(_inputValue, radix: 16);
        _convertedValue =
            'Binary: ${decimalValue.toRadixString(2)}\nDecimal: $decimalValue\nOctal: ${decimalValue.toRadixString(8)}';
      }

      setState(() {});
    } catch (e) {
      _convertedValue = 'Invalid Input';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue!;
                });
              },
              items: ['Binary', 'Decimal', 'Octal', 'Hexadecimal']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration:
                  InputDecoration(labelText: 'Enter $_selectedType Value'),
              onChanged: (value) {
                _inputValue = value;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _convertValues();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20.0),
            Text('Converted Values:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(_convertedValue),
          ],
        ),
      ),
    );
  }
}
