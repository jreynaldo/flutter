import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp( XylophonePage());

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Xylophone App'),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body:  SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(note: 1, color: Colors.red),
                Button(note: 2, color: Colors.orange),
                Button(note: 3, color: Colors.yellow),
                Button(note: 4, color: Colors.green),
                Button(note: 5, color: Colors.teal),
                Button(note: 6, color: Colors.blue),
                Button(note: 7, color: Colors.purple),
              ],
            ),
          ),
        ));
  }

  Future<void> play(int i) async {
    await _audioPlayer.play(AssetSource('note$i.wav'));
  }

  Widget Button({required int note, required MaterialColor color}) {
    return Expanded(
      child: TextButton(
          onPressed: () async {
            await play(note);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(color),
            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )),
          ),
          child: const Text('')),
    );
  }
}
