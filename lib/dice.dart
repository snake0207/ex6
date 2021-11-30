// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Image.asset('assets/dic_$leftDice.png')),
                  const SizedBox(width: 10.0),
                  Expanded(child: Image.asset('assets/dic_$rightDice.png')),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    leftDice = Random().nextInt(6) + 1;
                    rightDice = Random().nextInt(6) + 1;
                  });
                  showToast('left: $leftDice, right: $rightDice');
                },
                child: const Icon(Icons.play_arrow)),
          ],
        ),
      ),
    );
  }
}

void showToast(String display) {
  Fluttertoast.showToast(
    msg: display,
    backgroundColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
