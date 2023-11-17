import 'package:flutter/material.dart';
import 'package:simple_calculator/pages/calculator.dart';
import 'package:simple_calculator/pages/coverter.dart';
import 'package:simple_calculator/pages/binary_operation.dart';
import 'package:simple_calculator/pages/unit_coverter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.calculate),
              iconSize: 64.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorPage()),
                );
              },
            ),
            SizedBox(height: 20.0),
            Text('Calculator'),
            SizedBox(height: 40.0),
            IconButton(
              icon: Icon(Icons.compare_arrows),
              iconSize: 64.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConverterPage()),
                );
              },
            ),
            SizedBox(height: 20.0),
            Text('Converter'),
            SizedBox(height: 40.0),
            IconButton(
              icon: Icon(Icons.functions),
              iconSize: 64.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BinaryOperationPage()),
                );
              },
            ),
            SizedBox(height: 20.0),
            Text('Binary Operations'),
            SizedBox(height: 40.0),
            IconButton(
              icon: Icon(Icons.straighten),
              iconSize: 64.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UnitConverterPage()),
                );
              },
            ),
            SizedBox(height: 20.0),
            Text('Unit Converter'),
          ],
        ),
      ),
    );
  }
}
