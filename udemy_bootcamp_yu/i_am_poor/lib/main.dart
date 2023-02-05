import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I am poor'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        body: const Center(
          child: Image(image: AssetImage('images/charbon.jpg')),
        ),
      ),
    ),
  );
}
