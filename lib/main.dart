// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:login_ui/components/provider/connectivity_provider.dart';
import 'package:login_ui/elect.dart';
import 'package:login_ui/home.dart';
import 'package:login_ui/widget/connectivityAlert.dart';
import 'package:provider/provider.dart';
import 'Screens/login/login.dart';
import 'wrapper.dart';
import 'page/editable_page.dart';
import 'data/globalScaff.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: Wrapper(),
        )
      ],
      child: MaterialApp(
      //    builder: (context, widget) => ResponsiveWrapper.builder(
      //     child,
      //     maxWidth: 1200,
      //     minWidth: 480,
      //     defaultScale: true,
      //     breakpoints: [
      //       ResponsiveBreakpoint.resize(480, name: MOBILE),
      //       ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //       ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      //     ],
      //     background: Container(color: Color(0xFFF5F5F5))),
      // initialRoute: "/",
        title: 'Flutter Login',
        scaffoldMessengerKey: snackbarKey,
        routes: {
          '/elect': (context) => ElectRtn(),
        },

        theme: ThemeData(
          primaryColor: Color(0xFF2661FA),
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        
        home: Wrapper(),
      ),
    );
  }
}
