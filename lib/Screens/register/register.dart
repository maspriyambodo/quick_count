import 'package:flutter/material.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/api.dart';
import 'package:login_ui/components/background.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:login_ui/data/globalScaff.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  final cpassController = TextEditingController();

  String error = '';

  String message = '';

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
          physics: ClampingScrollPhysics(),
          child: Container(
            height: size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: nameController,
                      validator: (String? val) =>
                          val!.isEmpty ? 'Please Enter Name' : null,
                      decoration: InputDecoration(labelText: "Name"),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: emailController,
                      validator: (String? val) =>
                          val!.isEmpty ? 'Email cannot be Empty' : null,
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (String? val) =>
                          val!.isEmpty ? 'Password Cannot be Empty' : null,
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: cpassController,
                      validator: (String? val) => val != passwordController.text
                          ? 'Password Did not Match'
                          : null,
                      decoration:
                          InputDecoration(labelText: "Confirm Password"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: RaisedButton(
                      onPressed: () async {
                        var results = await Connectivity().checkConnectivity();

                        print(results);

                        if (_formKey.currentState!.validate()) {
                          if (results == ConnectivityResult.none) {
                            final SnackBar snackBar = SnackBar(
                                content:
                                    Text("No Internet Connection Available"));
                            snackbarKey.currentState?.showSnackBar(snackBar);
                          } else {
                            var email = emailController.text;
                            var name = nameController.text;
                            var password = passwordController.text;
                            var cpass = cpassController.text;

                            var rsp = await registerUser(
                                email, password, cpass, name);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "SIGN UP",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()))
                      },
                      child: Text(
                        "Already Have an Account? Sign in",
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
      ),
    );
  }
}
