import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_ui/Screens/register/register.dart';
import 'package:login_ui/Screens/register/signup.dart';
import 'package:login_ui/api.dart';
import 'package:login_ui/candidates.dart';
import 'package:login_ui/components/background.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/elect.dart';
import 'package:login_ui/home.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:login_ui/data/globalScaff.dart';
import 'package:login_ui/model/candidates.dart';
import 'package:login_ui/page/editable_page.dart';
import 'package:login_ui/widget/loading.dart';

class SignScreen extends StatefulWidget {
  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String error = '';

  String message = '';

  final _storage = FlutterSecureStorage();

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
                physics: ClampingScrollPhysics(),
                child: Container(
                  height: size.height,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              "assets/images/header.png",
                              height: size.height * 0.35,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'SIGN IN',
                              style: GoogleFonts.inter(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Email',
                                    style: GoogleFonts.openSans(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    validator: (String? val) => val!.isEmpty
                                        ? 'Please enter email'
                                        : null,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  229, 229, 229, 1.0))),
                                      prefixIcon: const Icon(Icons.email,
                                          color: Color.fromRGBO(
                                              135, 135, 135, 1.0)),
                                      filled: true,
                                      fillColor:
                                          Color.fromRGBO(229, 229, 229, 1.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 230, 10),
                                  child: Text(
                                    'Password',
                                    style: GoogleFonts.openSans(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    validator: (String? val) => val!.isEmpty
                                        ? 'Please enter password'
                                        : null,
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  229, 229, 229, 1.0))),
                                      prefixIcon: const Icon(Icons.lock,
                                          color: Color.fromRGBO(
                                              135, 135, 135, 1.0)),
                                      filled: true,
                                      fillColor:
                                          Color.fromRGBO(229, 229, 229, 1.0),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    error,
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(216, 181, 58, 1.0),
                                        fontSize: 14.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: FlatButton(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    color: Color.fromRGBO(207, 10, 10, 1),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        var results = await Connectivity()
                                            .checkConnectivity();

                                        if (results ==
                                            ConnectivityResult.none) {
                                          final SnackBar snackBar = SnackBar(
                                              content: Text(
                                                  "No Internet Connection Available"));
                                          snackbarKey.currentState
                                              ?.showSnackBar(snackBar);
                                        } else {
                                          setState(() => loading = true);

                                          var email = emailController.text;
                                          var password =
                                              passwordController.text;

                                          print(email + ' ' + password);

                                          var rsp =
                                              await loginUser(email, password);
                                          print(rsp);
                                          var data =
                                              new Map<String, dynamic>.from(
                                                  rsp['data']);
                                          if (data["token"] != null) {
                                            String _tokenValue = data["token"];
                                            print(_tokenValue);
                                            await _storage.write(
                                                key: 'token',
                                                value: _tokenValue);

                                            var token = await _storage.read(
                                                key: 'token');
                                            print(token);

                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => ElectRtn()));

                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignupScreen()),
                                              (Route<dynamic> route) => false,
                                            );
                                          } else {
                                            setState(() {
                                              error =
                                                  'Please supply valid email';
                                              loading = false;
                                            });
                                          }
                                        }
                                      }
                                    },
                                    child: Text(
                                      'LOGIN',
                                      style: GoogleFonts.poppins(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          );
  }
}
