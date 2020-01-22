import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class AircraftType extends StatefulWidget {
  @override
  _AircraftTypeState createState() => _AircraftTypeState();
}

class _AircraftTypeState extends State<AircraftType> {
  @override
  Widget build(BuildContext context) {
    final aircraft = Provider.of<QuerySnapshot>(context);
    //print(aircraft.documents);
    for (var doc in aircraft.documents) {
      print(doc.data);
    }

    return Container();
  }
}
