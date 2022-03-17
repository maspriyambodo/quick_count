import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/candidates.dart';
import 'package:login_ui/votes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/api.dart';

class ElectRtn extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _ElectRtnState createState() => _ElectRtnState();
}

class _ElectRtnState extends State<ElectRtn> {
  String? _chosenValue;
  String? _chosenValue1;
  String? _chosenValue0;
  String? elpos;
  String? authtoken;
  String? _stat;
  bool _show = true;
  final _storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votes Registry'),
      ),
      body: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(0.0),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
              child: DropdownButton<String>(
                value: _chosenValue0,
                //elevation: 5,
                style: TextStyle(color: Colors.black),

                items: <String>[
                  '010101',
                  '010102',
                  '010103',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList(),
                hint: Text(
                  "Please choose polling precint",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _chosenValue0 = newValue!;
                    _storage.write(key: 'precint', value: _chosenValue0);
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(0.0),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
              child: DropdownButton<String>(
                value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.black),

                items: <String>[
                  'President',
                  'Vice President',
                  'Senator',
                  'Party List',
                  'Member House of Representatives',
                  'Mayor',
                  'Vice Mayor',
                  'Councilor',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList(),
                hint: Text(
                  "Please choose electoral position",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _chosenValue = newValue!;
                    _storage.write(key: 'position', value: _chosenValue);

                    if (_chosenValue == "President" ||
                        _chosenValue == "Vice President" ||
                        _chosenValue == "Senator" ||
                        _chosenValue == "Party List") {
                      _show = false;
                    } else {
                      _show = true;
                    }
                  });
                },
              ),
            ),
            Visibility(
              visible: _show,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(0.0),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                child: DropdownButton<String>(
                  value: _chosenValue1,
                  //elevation: 5,
                  style: TextStyle(color: Colors.black),

                  items: <String>[
                    'Makati',
                    'Pasay',
                    'Quezon City',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Please choose area",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _chosenValue1 = newValue!;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0)),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                final data = Data(text: "$_chosenValue");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VotesCnt(
                            )));
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Data {
  String text;
  Data({required this.text});
}
