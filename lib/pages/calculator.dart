import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  List<String> historyLog = [];

  _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _clear();
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      _performOperation(buttonText);
    } else if (buttonText == "=") {
      _calculateResult();
      setState(() {
        _updateHistoryLog("=");
      });
    } else {
      if (_output == "0" || _output == "Error") {
        setState(() {
          _output = buttonText;
        });
      } else {
        setState(() {
          _output += buttonText;
        });
      }
    }
  }

  void _clear() {
    setState(() {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    });
  }

  void _performOperation(String newOperand) {
    if (operand.isNotEmpty) {
      num2 = double.parse(_output);
      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
        case "-":
          _output = (num1 - num2).toString();
        case "*":
          _output = (num1 * num2).toString();
        case "/":
          if (num2 != 0) {
            _output = (num1 / num2).toString();
          } else {
            _output = "Error";
          }
      }
    }
    num1 = double.parse(_output);
    operand = newOperand;
    _output = "0";
  }

  void _calculateResult() {
    if (operand.isNotEmpty) {
      num2 = double.parse(_output);
      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
        case "-":
          _output = (num1 - num2).toString();
        case "*":
          _output = (num1 * num2).toString();
        case "/":
          if (num2 != 0) {
            _output = (num1 / num2).toString();
          } else {
            _output = "Error";
          }
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
  }

  void _updateHistoryLog(String buttonText) {
    historyLog.add(_output);
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(24.0)),
        ),
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              reverse: true,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                  child: Text(
                    _output,
                    style:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: const Color.fromARGB(255, 64, 64, 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "History Log",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: historyLog.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(historyLog[index]),
                            onTap: () => _onHistoryTap(historyLog[index]),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("*"),
                ],
              ),
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: [
                  _buildButton("C"),
                  _buildButton("0"),
                  _buildButton("="),
                  _buildButton("+"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onHistoryTap(String historyItem) {
    setState(() {
      _output = historyItem;
    });
  }
}
