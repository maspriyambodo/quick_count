import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/components/background.dart';
import 'package:login_ui/data/users.dart';
import 'package:login_ui/model/user.dart';
import 'package:login_ui/utils.dart';
import 'package:login_ui/widget/scrollable_widget.dart';
import 'package:login_ui/widget/loading.dart';
import 'package:login_ui/widget/text_dialog_widget.dart';
import 'package:login_ui/Screens/login/signin.dart';
import 'package:login_ui/Screens/table/incident.dart';
import '../api.dart';
import '../elect.dart';

class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  late List<User> users;

  var _controller = ScrollController();
  var _isVisible = true;
  final _storage = FlutterSecureStorage();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => loading
      ? Loading()
      : Scaffold(
          appBar: AppBar(
            title: Text("VOTE REGISTRY"),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IncidentScreen()),
                      );
                    },
                    child: Icon(
                      Icons.security_update_warning_outlined,
                      size: 26.0,
                    ),
                  )),
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
              onPressed: () {
                print(users.length);

                Widget cancelButton = ElevatedButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
                Widget continueButton = ElevatedButton(
                  child: Text("Continue"),
                  onPressed: () async {
                    print(users);
                    //await SubmitData(users);

                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text("Info"),
                              content: Text("Votes submission completed"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacementNamed(
                                        context, '/elect');
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
              },
              child: Icon(Icons.run_circle),
            ),
          ),
        );

  Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', '# Votes'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isboto = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isboto,
      );
    }).toList();
  }

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.boto];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1 || index == 2;

            return DataCell(
              Text('$cell'),
              //showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    // editFirstName(user);
                    break;
                  case 1:
                    //   editLastName(user);
                    break;
                  case 2:
                    editBoto(user);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstName(User editUser) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editUser.firstName,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(firstName: firstName) : user;
        }).toList());
  }

  Future editLastName(User editUser) async {
    final lastName = await showTextDialog(
      context,
      title: 'Change Last Name',
      value: editUser.lastName,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(lastName: lastName) : user;
        }).toList());
  }

  Future editBoto(User editUser) async {
    final boto = await showTextDialog(
      context,
      title: 'Input number of votes',
      value: editUser.boto.toString(),
    );

    var botos = int.parse(boto);

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(boto: botos) : user;
        }).toList());
  }
}
