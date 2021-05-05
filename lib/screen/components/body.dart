import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

import 'buildButton.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController controller;
  String text = "";
  String result = "";
  String expression = "";

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Creating text field to display the result
        Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topRight,
          child: Text(
            text,
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.white, fontSize: 30),
          ),
        ),
        //Creating text field to show the result
        Container(
          alignment: Alignment.topRight,
          child: Text(
            result,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.red, fontSize: 25),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
        //Creating button layout
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              //color: Colors.red,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      BuildButton(
                        text: "9",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("9");
                        },
                      ),
                      BuildButton(
                        text: "-",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("-");
                        },
                      ),
                      BuildButton(
                        text: "×",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("×");
                        },
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildButton(
                        text: "6",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("6");
                        },
                      ),
                      BuildButton(
                        text: "7",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("7");
                        },
                      ),
                      BuildButton(
                        text: "8",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("8");
                        },
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildButton(
                        text: "3",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("3");
                        },
                      ),
                      BuildButton(
                        text: "4",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("4");
                        },
                      ),
                      BuildButton(
                        text: "5",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("5");
                        },
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildButton(
                        text: "0",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("0");
                        },
                      ),
                      BuildButton(
                        text: "1",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("1");
                        },
                      ),
                      BuildButton(
                        text: "2",
                        height: 1,
                        color: Colors.transparent,
                        onPressed: () {
                          buttonPressed("2");
                        },
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      BuildButton(
                        text: "C",
                        height: 1,
                        color: Colors.redAccent,
                        onPressed: () {
                          buttonPressed("C");
                        },
                      ),
                      BuildButton(
                        text: "⌫",
                        height: 1,
                        color: Colors.green,
                        onPressed: () {
                          buttonPressed("⌫");
                        },
                      ),
                      BuildButton(
                        text: "÷",
                        height: 1,
                        color: Colors.blue,
                        onPressed: () {
                          buttonPressed("÷");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      BuildButton(
                        height: 2,
                        text: "+",
                        onPressed: () {
                          buttonPressed("+");
                        },
                        color: Colors.pink,
                      ),
                    ],
                  ),
                  TableRow(children: [
                    BuildButton(
                      height: 3,
                      text: "=",
                      onPressed: () {
                        buttonPressed("=");
                      },
                      color: Colors.blueGrey,
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        text = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        text = text.substring(0, text.length - 1);
        if (text == "") {
          text = "0";
        }
      } else if (buttonText == "=") {
        expression = text;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (text == "0") {
          text = buttonText;
        } else {
          text = text + buttonText;
        }
      }
    });
  }
}
