import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage('images/monkey.png'),
            ),
            Text(
              'Little Cute Monkey',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'KEYBOARD MANIAC',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade100,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(color: Colors.teal.shade100),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 25.0,
                  color: Colors.teal,
                ),
                title: Text(
                  '3 290 203030',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.teal[900],
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 25.0,
                  color: Colors.teal,
                ),
                title: Text(
                  'monkey@genius.com',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.teal[900],
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
