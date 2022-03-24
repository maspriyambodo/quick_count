import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignScreen extends StatefulWidget {
  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
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
                      'Username',
                      style: GoogleFonts.openSans(
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Color.fromRGBO(229, 229, 229, 1.0))),
                        prefixIcon: const Icon(Icons.email, color: Color.fromRGBO(135, 135, 135, 1.0)),
                        filled: true,
                        fillColor: Color.fromRGBO(229, 229, 229, 1.0),
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
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Color.fromRGBO(229, 229, 229, 1.0))),
                        prefixIcon: const Icon(Icons.lock, color: Color.fromRGBO(135, 135, 135, 1.0)),
                        filled: true,
                        fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(89, 111, 226, 1),
                        ),
                      ),
                      color: Color.fromARGB(255, 253, 253, 253),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      color: Color.fromRGBO(207, 10, 10, 1),
                      onPressed: () {},
                      child: Text(
                        'LOGIN',
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
        ]
      ),
      ),
    );
  }
}
