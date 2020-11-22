import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:travel_ex/dbconnect/model.dart';
import 'package:intl/intl.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _controllertitle = TextEditingController();
  final _controllerdesc = TextEditingController();
  String name = "";
  Box AddBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AddBox = Hive.box('adventure');
  }

  void addMemory(Model model) {
    Hive.box('adventure').add(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add A New Adventure"),
        ),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(name),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _controllertitle,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "Name your Adventure",
                      filled: true,
                      fillColor: Colors.grey[200])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _controllerdesc,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "Describe it",
                      filled: true,
                      fillColor: Colors.grey[200])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                label: Text("Add Adventure"),
                onPressed: () {
                  final title = _controllertitle.text;
                  final desc = _controllerdesc.text;
                  var now = new DateTime.now();
                  var formatter = new DateFormat('yyyy-MM-dd');
                  String formattedDate = formatter.format(now);
                  final newMemory =
                      Model(formattedDate, formattedDate, title, desc);
                  AddBox.add(newMemory);

                  Fluttertoast.showToast(
                      msg: "Added Memory",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.pop(context);
                },
              ),
            ),
          ]),
        ));
  }
}

//TODO

// Design: Add a TextBox to write about the Adventure-Done
//         Add an Image view such that the user can add a certain image
//         Add an option to add the location
//
// Implementation: On Submit, add the details to the SQLLite DB
//     Implement a way to add image to DB
//     Get the location on button click
//     Get the system current time and date
