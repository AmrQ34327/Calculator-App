import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 2, 26, 240)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  bool calculated = false;

  void delete() {
    String lastCharacter =
        textController.text.substring(textController.text.length - 1);
    if (lastCharacter != " ") {
      textController.text =
          textController.text.substring(0, textController.text.length - 1);
    } else {
      textController.text =
          textController.text.substring(0, textController.text.length - 3);
    }
  }

  void calculate() {
    // calculate what is inside the textfield
    Parser p = Parser();
    String expression = textController.text.replaceAll("x", "*");
    String expression2 = expression.replaceAll("÷", "/");
    Expression expression3 = p.parse(expression2);
    double result = expression3.evaluate(EvaluationType.REAL, ContextModel());
    textController.clear();
    textController.text = result.toString();
    String last2Characters =
        textController.text.substring(textController.text.length - 2);
    if (last2Characters == ".0"){
      textController.text =
          textController.text.substring(0, textController.text.length - 2);
    }    
    calculated = true;
  }

  void clearText() {
    if (calculated) {
      textController.clear();
    }
    calculated = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(218, 27, 2, 250),
            title: const Text(
              "Calculator",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: textController,
                  readOnly: true,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                  decoration:  InputDecoration(
                    suffixIcon: InkWell(
                      onTap: textController.clear,
                       child: const Text("Clear",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12 ,)
                       )
                  ),
                )
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}(";
                        setState() {}
                      },
                      child: const Text('('),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text})";
                        setState() {}
                      },
                      child: const Text(')'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text} % ";
                        setState() {}
                      },
                      child: const Text('%'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        delete();
                        setState() {}
                      },
                      child: const Icon(Icons.backspace),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}7";
                        setState() {}
                      },
                      child: const Text('7'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}8";
                        setState() {}
                      },
                      child: const Text('8'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}9";
                        setState() {}
                      },
                      child: const Text('9'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text} ÷ ";
                        setState() {}
                      },
                      child: const Text('÷'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}4";
                        setState() {}
                      },
                      child: const Text('4'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}5";
                        setState() {}
                      },
                      child: const Text('5'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}6";
                        setState() {}
                      },
                      child: const Text('6'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text} x ";
                        setState() {}
                      },
                      child: const Text('x'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}1";
                        setState() {}
                      },
                      child: const Text('1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}2";
                        setState() {}
                      },
                      child: const Text('2'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}3";
                        setState() {}
                      },
                      child: const Text('3'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text} - ";
                        setState() {}
                      },
                      child: const Text('-'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}0";
                        setState() {}
                      },
                      child: const Text('0'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearText();
                        textController.text = "${textController.text}.";
                        setState() {}
                      },
                      child: const Text('.'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 18, 32, 224),
                        ),
                      onPressed: () {
                        calculate();
                        setState() {}
                      },
                      child: const Text('=',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        textController.text = "${textController.text} + ";
                        setState() {}
                      },
                      child: const Text('+'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
