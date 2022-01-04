import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Hello, world!'),
            backgroundColor: Colors.blueGrey[900]),
        backgroundColor: Colors.lightBlue,
        body: const Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
