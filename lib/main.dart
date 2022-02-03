// ignore_for_file: unnecessary_string_interpolations

import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  var numArray = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
  var operatorsArray = {"+", "-", "*", "/"};
  String firstNum = "";
  String secondNum = "";
  String operator = "";
  int result = 0;

  void buttonClicked(String btnValue) {
    setState(() {
      if (operator.isEmpty && numArray.contains(btnValue)) {
        firstNum = firstNum + btnValue;
      } else if (result == 0 &&
          firstNum.isNotEmpty &&
          operatorsArray.contains(btnValue)) {
        operator = btnValue;
      } else if (operator.isNotEmpty && numArray.contains(btnValue)) {
        secondNum = secondNum + btnValue;
      } else if (btnValue == "=") {
        int num1 = int.parse(firstNum);
        int num2 = int.parse(secondNum);
        if (operator == "+") {
          result = (num1 + num2);
        } else if (operator == "-") {
          result = (num1 - num2);
        } else if (operator == "*") {
          result = (num1 * num2);
        } else if (operator == "/") {
          result = (num1 ~/ num2);
        }
        // firstNum = "";
        // secondNum = "";
        // operator = "";

        //  else if (operator == "-") {
        //   result = (int.parse(firstNum) - int.parse(secondNum));
        // } else if (operator == "*") {
        //   result = (int.parse(firstNum) * int.parse(secondNum));
        // } else if (operator == "/") {
        //   result = (int.parse(firstNum) ~/ int.parse(secondNum));
        // }
        // result = int.parse(firstNum + secondNum);
      } else if (btnValue == "Clr") {
        firstNum = "";
        secondNum = "";
        operator = "";
        result = 0;
      } else if (result != 0) {
        operator = btnValue;
        secondNum = "";
        firstNum = result.toString();
      }
    });
  }

  Widget customButton(String btnValue) {
    return Expanded(
        child: RaisedButton(
      padding: const EdgeInsets.all(10),
      onPressed: () => buttonClicked(btnValue),
      child: Text(
        btnValue,
        style: const TextStyle(
          fontSize: 24,
          height: 3.5,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      // "First Number",
                      "$firstNum",
                      style: TextStyle(fontSize: 35),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          // "Operator",
                          "$operator",
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w700)),
                    ),
                    Text(
                      // "Second Number",
                      "$secondNum",
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  "$result",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
                ),
                padding: const EdgeInsets.fromLTRB(0, 10, 20, 15),
                alignment: Alignment.bottomRight,
              ),
            ),
            Row(
              children: <Widget>[
                customButton("7"),
                customButton("8"),
                customButton("9"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("4"),
                customButton("5"),
                customButton("6"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("1"),
                customButton("2"),
                customButton("3"),
                customButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("Clr"),
                customButton("0"),
                customButton("/"),
                customButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
