import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Screens/login/signin.dart';
import 'package:login_ui/api.dart';
import 'package:login_ui/page/editable_page.dart';
import 'package:login_ui/widget/loading.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final mobileController = TextEditingController();

  final nameController = TextEditingController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.03),
                      Image.asset(
                        "assets/images/header.png",
                        height: size.height * 0.35,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 200, 10),
                        child: Text(
                          'Hellooo...',
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 280, 5),
                              child: Text(
                                'Name',
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                validator: (String? val) =>
                                    val!.isEmpty ? 'Please Enter Name' : null,
                                style: TextStyle(fontSize: 22, height: 0.5),
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              229, 229, 229, 1.0))),
                                  prefixIcon: const Icon(Icons.person,
                                      color:
                                          Color.fromRGBO(135, 135, 135, 1.0)),
                                  filled: true,
                                  fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 280, 10),
                              child: Text(
                                'Email',
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                validator: (String? val) =>
                                    val!.isEmpty ? 'Please Enter Name' : null,
                                style: TextStyle(fontSize: 22, height: 0.5),
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              229, 229, 229, 1.0))),
                                  prefixIcon: const Icon(Icons.email,
                                      color:
                                          Color.fromRGBO(135, 135, 135, 1.0)),
                                  filled: true,
                                  fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 200, 10),
                              child: Text(
                                'Mobile Number',
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9+]'))
                                ],
                                validator: (String? val) =>
                                    val!.isEmpty ? 'Please Enter Name' : null,
                                style: TextStyle(fontSize: 22, height: 0.5),
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              229, 229, 229, 1.0))),
                                  prefixIcon: const Icon(Icons.lock,
                                      color:
                                          Color.fromRGBO(135, 135, 135, 1.0)),
                                  filled: true,
                                  fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(110, 10, 110, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Color.fromRGBO(207, 10, 10, 1),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditablePage()));
                          },
                          child: Text(
                            'Continue',
                            style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });

                            await logoutUser();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignScreen()));
                          },
                          child: Text(
                            "Return to Sign in Screen",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2661FA)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
