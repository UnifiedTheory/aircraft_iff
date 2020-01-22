import 'package:aircraft_iff/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aircraft_iff/services/database.dart';
import 'package:provider/provider.dart';
import 'package:aircraft_iff/screens/home/AircraftType.dart';
import 'package:aircraft_iff/models/aircraft.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AircraftType>>.value(
      value: DatabaseService().aircraft,
      child: Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          title: Text('Aircraft ID'),
          backgroundColor: Colors.purpleAccent,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signout();
              },
            )
          ],
        ),
        body: AircraftType(),
      ),
    );
  }
}
