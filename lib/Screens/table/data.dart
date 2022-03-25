import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataScreen extends StatefulWidget {
  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     Orientation orientation = MediaQuery.of(context).orientation;


    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              // Container(
              // child: Text(
              //   'Leni Robredo',
              // style: GoogleFonts.openSans(
              //   color: Colors.white,
              //   fontSize: 22,
              // )), 
              // decoration: BoxDecoration(
              //   color: Colors.blue,
              //   borderRadius: BorderRadius.circular(8.0)),
              // ),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                  padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepOrange[400],
                      ),
                     child: Text(
                      'Bongbong MarcosBongbong Marcos',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
              )), 
                ),
                ),
            SizedBox(width: 10,),
             Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Color.fromRGBO(229, 229, 229, 1.0))),
                        filled: true,
                        fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                      ),
                    ),
                  ),
             ),
          ],
          ),
          color: Colors.red,
        )
      ],
    );
  }
}
