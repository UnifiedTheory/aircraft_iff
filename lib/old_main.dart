import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: Text('Aircraft ID'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/Wildcat_USS_Indy.png'),
          ),
        ),
      ),
    ),
  );
}
