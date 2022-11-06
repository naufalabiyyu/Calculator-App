import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var sbValue = new StringBuffer();
  String operator = "";
  late int valueA;
  late int valueB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  sbValue.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: [
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
                onTap: () {
                  clearValue();
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+/-',
                onTap: () {},
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
                onTap: () {},
              ),
              CalculatorButton.icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'Backspace',
                icon: Icons.backspace,
                onTap: () {
                  deleteValue();
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '7',
                onTap: () {
                  appendValue("7");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '8',
                onTap: () {
                  appendValue("8");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '9',
                onTap: () {
                  appendValue("9");
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '/',
                onTap: () {
                  appendValue("/");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '4',
                onTap: () {
                  appendValue("4");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '5',
                onTap: () {
                  appendValue("5");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '6',
                onTap: () {
                  appendValue("6");
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'X',
                onTap: () {
                  appendValue("x");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '1',
                onTap: () {
                  appendValue("1");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '2',
                onTap: () {
                  appendValue("2");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '3',
                onTap: () {
                  appendValue("3");
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '-',
                onTap: () {
                  appendValue("-");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
                onTap: () {
                  appendValue("0");
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
                onTap: () {},
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
                onTap: () {
                  appendValue("=");
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '+',
                onTap: () {
                  appendValue("+");
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    sbValue.write("0");
    operator = "";
  }

  void appendValue(String str) => setState(
        () {
          bool isDoCalculate = false;
          String strValue = sbValue.toString();
          String lastCharacter = strValue.substring(strValue.length - 1);
          print(lastCharacter);
          if (str == "0" &&
              (lastCharacter == "/" ||
                  lastCharacter == "x" ||
                  lastCharacter == "-" ||
                  lastCharacter == "+")) {
            return;
          } else if (str == "0" && sbValue.toString() == "0") {
            return;
          } else if (str == "=") {
            isDoCalculate = true;
          } else if (str == "/" || str == "x" || str == "-" || str == "+") {
            if (operator.isEmpty) {
              operator = str;
            } else {
              isDoCalculate = true;
            }
          }

          if (!isDoCalculate) {
            if (sbValue.toString() == "0" && str != "0") {
              sbValue.clear();
            }
            sbValue.write(str);
          } else {
            List<String> values = sbValue.toString().split(operator);
            if (values.length == 2 &&
                values[0].isNotEmpty &&
                values[1].isNotEmpty) {
              valueA = int.parse(values[0]);
              valueB = int.parse(values[1]);
              sbValue.clear();
              int total = 0;
              switch (operator) {
                case "/":
                  total = valueA ~/ valueB;
                  break;
                case "x":
                  total = valueA * valueB;
                  break;
                case "-":
                  total = valueA - valueB;
                  break;
                case "+":
                  total = valueA + valueB;
              }
              sbValue.write(total);
              if (str == "/" || str == "x" || str == "-" || str == "+") {
                operator = str;
                sbValue.write(str);
              } else {
                operator = "";
              }
            } else {
              String strValue = sbValue.toString();
              String lastCharacter = strValue.substring(strValue.length - 1);
              if (str == "/" || str == "x" || str == "-" || str == "+") {
                operator = "";
                sbValue.clear();
                sbValue.write(
                    strValue.substring(0, strValue.length - 1) + "" + str);
                operator = str;
              } else if (str == "=" &&
                  (lastCharacter == "/" ||
                      lastCharacter == "x" ||
                      lastCharacter == "-" ||
                      lastCharacter == "+")) {
                operator = "";
                sbValue.clear();
                sbValue.write(strValue.substring(0, strValue.length - 1));
              }
            }
          }
        },
      );

  void deleteValue() => setState(() {
        String strValue = sbValue.toString();
        if (strValue.length > 0) {
          String lastCharacter = strValue.substring(strValue.length - 1);
          if (lastCharacter == "/" ||
              lastCharacter == "x" ||
              lastCharacter == "-" ||
              lastCharacter == "+") {
            operator = "";
          }
          strValue = strValue.substring(0, strValue.length - 1);
          sbValue.clear();
          sbValue.write(strValue.length == 0 ? "0" : strValue);
        }
      });

  void clearValue() => setState(() {
        operator = "";
        sbValue.clear();
        sbValue.write("0");
      });
}

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData? icon;
  final void Function() onTap;

  CalculatorButton({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  CalculatorButton.icon({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: icon == null
              ? Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: foregroundColor),
                )
              : Icon(
                  icon,
                  color: foregroundColor,
                ),
        ),
      ),
    );
  }
}
