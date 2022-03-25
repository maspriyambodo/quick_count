import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class IncidentScreen extends StatefulWidget {
  @override
  State<IncidentScreen> createState() => _IncidentScreenState();
}

class _IncidentScreenState extends State<IncidentScreen> {
  final _controller = TextEditingController();
  final precintController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void randomNumber() {
    var random = new Random();

    int min = 99999;

    int max = 999999;

    String result = (min + random.nextInt(max - min)).toString();

    setState(() {
      _controller.text = result;
    });
  }

  @override
  void initState() {
    super.initState();
    randomNumber();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(23, 21, 113, 1),
          title: Text('QuickCount'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                  child: Text(
                    'INCIDENT REPORT',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Incident Reference Number',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          readOnly: true,
                          controller: _controller,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            filled: true,
                            fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Title',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (String? val) =>
                              val!.isEmpty ? 'Title Cannot be empty' : null,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            filled: true,
                            fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Details',
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 55,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            filled: true,
                            fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: FlatButton(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: Color.fromRGBO(207, 10, 10, 1),
                    onPressed: () {},
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
