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
          title: Text("Add A New Memory"),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Text(name),
          Container(
            child: TextField(
                controller: _controllertitle,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    hintText: "Title",
                    filled: true,
                    fillColor: Colors.grey[200])),
            padding: EdgeInsets.all(32),
          ),
          Container(
            child: TextField(
                controller: _controllerdesc,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    hintText: "Enter your memories",
                    filled: true,
                    fillColor: Colors.grey[200])),
            padding: EdgeInsets.all(32),
          ),
          Container(
            width: double.infinity,
            child: FloatingActionButton.extended(
              label: Text("Submit"),
              onPressed: () {
                final key = _controllertitle.text;
                final value = _controllerdesc.text;
                var now = new DateTime.now();
                var formatter = new DateFormat('yyyy-MM-dd');
                String formattedDate = formatter.format(now);

                final newMemory =
                Model(formattedDate, formattedDate, value, value);

                AddBox.add(newMemory);

                // AddBox.put(key, value);

                Fluttertoast.showToast(
                    msg: "Added Memory",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
            ),
            padding: EdgeInsets.all(32),
          ),
        ]));
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
