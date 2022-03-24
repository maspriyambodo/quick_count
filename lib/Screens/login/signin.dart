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

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
                margin: EdgeInsets.fromLTRB(0, 0, 230, 10),
                child: Text(
                  'SIGN IN',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 230, 10),
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
                margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      margin: EdgeInsets.only(bottom: 0),
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
                      margin: EdgeInsets.only(left: 165),
                      child: FlatButton(
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
                    FlatButton(
                      padding: EdgeInsets.fromLTRB(130, 10, 130, 10),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
