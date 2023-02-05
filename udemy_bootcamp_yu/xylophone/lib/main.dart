import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  void playSound(int which) {
    player.play('note$which.wav');
  }

  Expanded buildKey({MaterialColor color, int note}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: () {
          playSound(note);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            buildKey(color: Colors.red, note: 1),
            buildKey(color: Colors.orange, note: 2),
            buildKey(color: Colors.yellow, note: 3),
            buildKey(color: Colors.green, note: 4),
            buildKey(color: Colors.blue, note: 5),
            buildKey(color: Colors.indigo, note: 6),
            buildKey(color: Colors.purple, note: 7),
          ]),
        ),
      ),
    );
  }
}
