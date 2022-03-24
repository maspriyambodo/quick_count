import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
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
                'SIGN UP',
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
                      style: TextStyle(fontSize: 22, height: 0.5),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Color.fromRGBO(229, 229, 229, 1.0))),
                        prefixIcon: const Icon(Icons.person, color: Color.fromRGBO(135, 135, 135, 1.0)),
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
                      style: TextStyle(fontSize: 22, height: 0.5),
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
              margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 250, 10),
                    child: Text(
                      'Password',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(fontSize: 22, height: 0.5),
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 200, 10),
                    child: Text(
                      'Confirm Password',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(fontSize: 22, height: 0.5),
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(110, 10, 110, 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                color: Color.fromRGBO(207, 10, 10, 1),
                onPressed: () {},
                child: Text(
                  'REGISTER',
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
    );
  }
}
