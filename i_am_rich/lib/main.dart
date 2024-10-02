import 'package:flutter/material.dart';

void main() {
  const url =
      'https://images.wondershare.com/recoverit/article/03/quote-wallpapers-for-iphone-1.png';
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('I am Rich'),
          backgroundColor: Colors.blueGrey[900],
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Image(image: NetworkImage(url)),
        ),
      ),
    ),
  );
}
