import 'package:flutter/material.dart';

class BinaryOperationPage extends StatefulWidget {
  @override
  _BinaryOperationPageState createState() => _BinaryOperationPageState();
}

class _BinaryOperationPageState extends State<BinaryOperationPage> {
  String _input1 = '';
  String _input2 = '';
  String _selectedOperation = 'AND';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Operations'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Input 1', _input1, (value) => _input1 = value),
            SizedBox(height: 16.0),
            _buildTextField('Input 2', _input2, (value) => _input2 = value),
            SizedBox(height: 16.0),
            _buildOperationDropdown(),
            ElevatedButton(
              onPressed: () => _performOperation(),
              child: Text('Perform Operation'),
            ),
            SizedBox(height: 16.0),
            Text('Result: $_result',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String value, Function(String) onChanged) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
      keyboardType:
          TextInputType.numberWithOptions(signed: false, decimal: false),
    );
  }

  Widget _buildOperationDropdown() {
    return DropdownButton<String>(
      value: _selectedOperation,
      onChanged: (String? newValue) {
        setState(() {
          _selectedOperation = newValue!;
        });
      },
      items: [
        'AND',
        'OR',
        'XOR',
        'NOT',
        'NAND',
        'NOR',
        'NXOR',
        'Left Shift',
        'Right Shift',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void _performOperation() {
    // Ensure that both input values are not empty
    if (_input1.isEmpty || _input2.isEmpty) {
      setState(() {
        _result = 'Inputs cannot be empty';
      });
      return;
    }

    // Parse input values as integers
    int input1 = int.parse(_input1, radix: 2);
    int input2 = int.parse(_input2, radix: 2);

    // Perform the selected binary operation
    switch (_selectedOperation) {
      case 'AND':
        _result = (input1 & input2).toRadixString(2);
        break;
      case 'OR':
        _result = (input1 | input2).toRadixString(2);
        break;
      case 'XOR':
        _result = (input1 ^ input2).toRadixString(2);
        break;
      case 'NOT':
        _result = (~input1).toRadixString(2);
        break;
      case 'NAND':
        _result = (~(input1 & input2)).toRadixString(2);
        break;
      case 'NOR':
        _result = (~(input1 | input2)).toRadixString(2);
        break;
      case 'NXOR':
        _result = (~(input1 ^ input2)).toRadixString(2);
        break;
      case 'Left Shift':
        _result = (input1 << input2).toRadixString(2);
        break;
      case 'Right Shift':
        _result = (input1 >> input2).toRadixString(2);
        break;
      default:
        _result = 'Invalid operation';
        break;
    }

    // Update the UI
    setState(() {
      _result = _result;
    });
  }
}
