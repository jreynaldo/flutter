

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee', style: TextStyle(
            color: Colors.white,

          ),

          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    )
  );
}

class DicePage extends StatefulWidget{
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState  extends State<DicePage>{
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  var random = Random();
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: [
          Expanded(child: TextButton(child: Image.asset('images/dice$leftDiceNumber.png'),
            onPressed: () {
             changeDaceFace();
            },
          )),
          Expanded(child: TextButton(child: Image.asset('images/dice$rightDiceNumber.png'),
            onPressed: () {
              changeDaceFace();
            },)),
        ],
      ),
    );
  }

  void changeDaceFace() {
        setState(() {
      leftDiceNumber = random.nextInt(6) + 1;
      rightDiceNumber = random.nextInt(6) + 1;
    });
  }
}

