import 'package:flutter/material.dart';

class UnitConverterPage extends StatefulWidget {
  @override
  _UnitConverterPageState createState() => _UnitConverterPageState();
}

class _UnitConverterPageState extends State<UnitConverterPage> {
  double inputValue = 0.0;
  double convertedValue = 0.0;
  String selectedInputUnit = 'Meter';
  String selectedOutputUnit = 'Centimeter';

  final Map<String, double> unitConversions = {
    'Meter': 1.0,
    'Centimeter': 100.0,
    'Kilometer': 0.001,
    'Millimeter': 1000.0,
    'Mile': 0.000621371,
    'Yard': 1.09361,
    'Foot': 3.28084,
    'Inch': 39.3701,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter Value'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                  _convert();
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildUnitDropdown('Input Unit', selectedInputUnit,
                (String? value) {
              if (value != null) {
                setState(() {
                  selectedInputUnit = value;
                  _convert();
                });
              }
            }),
            SizedBox(height: 16.0),
            _buildUnitDropdown('Output Unit', selectedOutputUnit,
                (String? value) {
              if (value != null) {
                setState(() {
                  selectedOutputUnit = value;
                  _convert();
                });
              }
            }),
            SizedBox(height: 16.0),
            Text(
                'Converted Value: $convertedValue ${selectedOutputUnit.toLowerCase()}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitDropdown(
      String label, String selectedValue, void Function(String?) onChanged) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: onChanged,
      items: unitConversions.keys.map((String unit) {
        return DropdownMenuItem<String>(
          value: unit,
          child: Text(unit),
        );
      }).toList(),
      hint: Text(label),
    );
  }

  void _convert() {
    double inputValueInMeter = inputValue / unitConversions[selectedInputUnit]!;

    convertedValue = inputValueInMeter * unitConversions[selectedOutputUnit]!;

    setState(() {
      convertedValue = convertedValue;
    });
  }
}
