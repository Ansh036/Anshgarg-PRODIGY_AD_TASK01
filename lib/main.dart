import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String input = "";
  double num1 = 0;
  double num2 = 0;
  String op = "";

  void press(String text) {
    setState(() {
      if (text == "C") {
        output = "0";
        input = "";
        num1 = 0;
        num2 = 0;
        op = "";
      } else if (text == "=") {
        num2 = double.parse(input);
        if (op == "+") output = (num1 + num2).toString();
        if (op == "-") output = (num1 - num2).toString();
        if (op == "*") output = (num1 * num2).toString();
        if (op == "/") output = (num1 / num2).toString();
        input = "";
      } else if (text == "+" || text == "-" || text == "*" || text == "/") {
        num1 = double.parse(input);
        op = text;
        input = "";
      } else {
        input += text;
        output = input;
      }
    });
  }

  Widget button(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => press(text),
        child: Text(text, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              button("7"),
              button("8"),
              button("9"),
              button("/")
            ],
          ),
          Row(
            children: [
              button("4"),
              button("5"),
              button("6"),
              button("*")
            ],
          ),
          Row(
            children: [
              button("1"),
              button("2"),
              button("3"),
              button("-")
            ],
          ),
          Row(
            children: [
              button("C"),
              button("0"),
              button("="),
              button("+")
            ],
          ),
        ],
      ),
    );
  }
}