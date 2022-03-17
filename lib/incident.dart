import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class IncedentReport extends StatefulWidget {
  IncedentReport({Key? key}) : super(key: key);

  @override
  State<IncedentReport> createState() => _IncedentReportState();
}

class _IncedentReportState extends State<IncedentReport> {
  bool _show = true;
  final _controller =
      new TextEditingController(text: Uuid().v1().substring(0, 8));
  String? _chosenValue0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Votes Registry'),
        ),
        body: Center(
          child: ListView(
            //  mainAxisAlignment: MainAxisAlignmen0t.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(0.0),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                child: Container(
                  child: TextFormField(
                    controller: _controller,
                    readOnly: true,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Incident Reference Number'),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0.0),
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Details'),
                    ),
                  )),
              Visibility(
                visible: _show,
                child: Container(
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
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
                      });
                    },
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
