import 'package:flutter/material.dart';

void showActionSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text("No internet Connection"),
  );

  Scaffold.of(context)..showSnackBar(snackBar);
}
