import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Magic 8 Ball' ), backgroundColor: Colors.blueAccent),
      backgroundColor: Colors.blue,
      body:  BallPage(),
    ),
  )
);

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;
  var random = Random();
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Row(
        children: [
          Expanded(child: TextButton(child:  Image.asset('images/ball$ballNumber.png'),
          onPressed: () {
            setState(() {
               ballNumber = random.nextInt(5) + 1;
            });
          })),
        ],
      )
    );
  }
}

