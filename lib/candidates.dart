import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Screens/login/signin.dart';
import 'package:login_ui/widget/loading.dart';
import 'package:login_ui/widget/tabbar_widget.dart';
import 'elect.dart';
import 'page/editable_page.dart';
import 'api.dart';
import 'widget/scrollable_widget.dart';
import 'data/globalScaff.dart';

class VotesCnt extends StatefulWidget {
  // final Data data;
  // VotesCnt({required this.data});

  @override
  _VotesCntState createState() => _VotesCntState();
}

class _VotesCntState extends State<VotesCnt> {
  List<dynamic> candidates = [];
  List<dynamic> filtercandidates = [];

  var _controller = ScrollController();
  var _isVisible = true;
  final _storage = FlutterSecureStorage();

  final _boto = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      // var rsp = await fetchCandidates();
      // var data = rsp['data'];

      // for (var counter = 0; counter <= data.length - 1; counter++) {
      //   data[counter]['boto'] = 0;
      //   if (data[counter]['position'] == "PARTY LIST") {
      //     data[counter]['lastname'] = 'potek';
      //     data[counter]['firstname'] = data[counter]['name'];
      //   } else {
      //     var tempName = data[counter]['name'].split(',');
      //     data[counter]['lastname'] = tempName[0];
      //     data[counter]['firstname'] = tempName[1];
      //   }
      //   setState(() {
      //     candidates.add(data[counter]);
      //   });
      // }
      // setState(() {
      //   filtercandidates = candidates;
      // });

      // filtercandidates = candidates
      //     .where((candidate) => candidate['position'] == 'PRESIDENT')
      //     .toList();
    });
  }

  void _filterData(value) {
    filtercandidates = candidates;

    setState(() {
      filtercandidates = candidates
          .where((candidate) => candidate['position'] == value)
          .toList();
    });
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String dropdownvalue = 'PRESIDENT';

  // List of items in our dropdown menu
  var items = [
    'PRESIDENT',
    'VICE-PRESIDENT',
    'SENATOR',
    'PARTY LIST',
  ];

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });

                  _filterData(newValue);
                },
              ),
              automaticallyImplyLeading: false,
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        await logoutUser();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignScreen()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Icon(
                        Icons.logout,
                        size: 26.0,
                      ),
                    )),
              ],
            ),
            body: ScrollableWidget(child: buildDataTable()),
            floatingActionButton: Visibility(
              visible: _isVisible,
              child: FloatingActionButton(
                tooltip: 'Increment',
                onPressed: () async {
                  var results = await Connectivity().checkConnectivity();

                  if (results == ConnectivityResult.none) {
                    final SnackBar snackBar = SnackBar(
                        content: Text("No Internet Connection Available"));
                    snackbarKey.currentState?.showSnackBar(snackBar);
                  } else {
                    Widget cancelButton = ElevatedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    );
                    Widget continueButton = ElevatedButton(
                      child: Text("Continue"),
                      onPressed: () async {
                        await SubmitData(filtercandidates, dropdownvalue);

                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text("Info"),
                                  content: Text("Votes submission completed"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          loading = true;
                                        });
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  super.widget),
                                          (Route<dynamic> route) => false,
                                        );
                                        // Navigator.pushReplacementNamed(
                                        //     context, '/elect');
                                        //                    Navigator.of(context).pop();
                                        //                  Navigator.push(context,
                                        //                     MaterialPageRoute(builder: (context) =>  ElectRtn()));
                                      },
                                      child: Text("Ok"),
                                    )
                                  ],
                                ));
                      },
                    );
                    // set up the AlertDialog
                    AlertDialog alert = AlertDialog(
                      title: Text("Data will be submitted to Control Center"),
                      content: Text("Would you like to continue?"),
                      actions: [
                        cancelButton,
                        continueButton,
                      ],
                    );
                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                },
                child: Icon(Icons.run_circle),
              ),
            ),
          );
  }

  Widget buildDataTable() {
    final columns = ['Name', '# Votes'];

    return DataTable(
        columns: getColumns(columns),
        rows: filtercandidates
            .map(
              (canditate) => DataRow(
                
                cells: [
                  DataCell(
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 250),
                      // child: Text(canditate['name']),
                    ),
                  ),
                  DataCell(
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 50),
                      // child: TextField(
                      //   decoration: InputDecoration(labelText: ""),
                      //   textAlign: TextAlign.center,
                      //   inputFormatters: [
                      //     FilteringTextInputFormatter.digitsOnly
                      //   ],
                      //   onChanged: (val) {
                      //     if (isNumeric(val)) {
                      //       setState(() {
                      //         canditate['boto'] = int.parse(val);
                      //       });
                      //     }
                      //   },
                      // ),
                    ),
                  ),
                ],
              ),
            )
            .toList());
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isboto = column == columns[1];

      return DataColumn(
        label: Text(column),
        numeric: isboto,
      );
    }).toList();
  }
}




// get data => data;
  // Widget build(BuildContext context) => TabBarWidget(
  //       title: 'Number of Votes',
  //       tabs: [
  //         Tab(text: ""),
  //         //Tab(text: 'Submit'),
  //         // Tab(icon: Icon(Icons.select_all), text: 'Selectable'),
  //       ],
  //       children: [
  //         EditablePage(),
  //         // Container(),
  //         // Container(),
  //       ],
  //     );
