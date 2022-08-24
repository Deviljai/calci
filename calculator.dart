import 'package:flutter/material.dart';


class Calci extends StatefulWidget {
  const Calci({Key? key}) : super(key: key);

  @override
  State<Calci> createState() => _CalciState();
}

class _CalciState extends State<Calci> {
  String out = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String opr = "";

  pressed(String buttontext) {
    print(buttontext);
    if (buttontext == "Clear") {
      out = "0";
      _out = "0";
      num1 = 0.0;
      num2 = 0.0;
      opr = "";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "*" ||
        buttontext == "/") {
      num1 = double.parse(out);
      opr = buttontext;
      _out = "0";
    } else if (buttontext == "=") {
      num2 = double.parse(out);
      if (opr == "+") {
        _out = (num1 + num2).toString();
      }
      if (opr == "-") {
        _out = (num1 - num2).toString();
      }
      if (opr == "*") {
        _out = (num1 * num2).toString();
      }
      if (opr == "/") {
        _out = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      opr = "";
    } else {
      _out = _out + buttontext;
    }
    setState(() {
      out = _out;
      print(out);
    });
  }

  Widget button(String buttontext) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          pressed(buttontext);
        },
        child: Text(buttontext,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(color: Colors.black,
        child: Column(
          children: [
            Container(
              child: Text(
                out,
                style: TextStyle(fontSize: 30,color: Colors.white),
              ),
            ),
            Expanded(child: Divider()),
            Column(
              children: [
                Row(
                  children: [
                    button("Clear"),
                    button("0"),
                    button("="),
                    button("/")
                  ],
                ),
                Row(
                  children: [
                    button("7"),
                    button("8"),
                    button("9"),
                    button("*"),
                  ],
                ),
                Row(
                  children: [
                    button("4"),
                    button("5"),
                    button("6"),
                    button("-")
                  ],
                ),
                Row(
                  children: [
                    button("1"),
                    button("2"),
                    button("3"),
                    button("+"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
