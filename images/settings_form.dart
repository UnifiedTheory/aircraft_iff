import 'package:aircraft_iff/models/user.dart';
import 'package:aircraft_iff/services/database.dart';
import 'package:aircraft_iff/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:aircraft_iff/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> f_18s = ['0', '1', '2', '3', '4'];

  //form values
  String _currentpt_17;
  String _currentf_18s;
  String _currentb_757;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update Aircraft Settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.f_18s,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentpt_17 = val),
                  ),
                  SizedBox(height: 20.0),
                  //dropdown
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _currentf_18s ?? userData.f_18s,
                    decoration: textInputDecoration,
                    items: f_18s.map((f_18) {
                      return DropdownMenuItem(
                        value: f_18,
                        child: Text('$f_18 f_18s'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentf_18s = val),
                  ),
                  SizedBox(height: 10.0),
                  Slider(
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    activeColor:
                        Colors.blue[_currentStrength ?? userData.strength],
                    inactiveColor:
                        Colors.blue[_currentStrength ?? userData.strength],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ), //Slider
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentpt_17 ?? userData.pt_17,
                              _currentf_18s ?? userData.f_18s,
                              _currentb_757 ?? userData.b_757,
                              _currentStrength ?? userData.strength);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
