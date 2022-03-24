import 'package:flutter/material.dart';

class PositionButton extends StatefulWidget {
  const PositionButton({Key? key}) : super(key: key);

  @override
  State<PositionButton> createState() => _PositionButton();
}

class _PositionButton extends State<PositionButton> {
  String dropdownValue = 'PRESIDENT';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 201, 42, 42)),
      underline: Container(
        height: 2,
        color: Color.fromARGB(255, 197, 13, 13),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['PRESIDENT', 'VICE PRESIDENT', 'SENATOR', 'PARTY LIST']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
