import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Design the Add Adventure here'),
            ],
          ),
        )
      ),
    );
  }
}

//TODO

// Design: Add a TextBox to write about the Adventure
//         Add an Imageview such that the user can add a certain image
//         Add an option to add the location
//
// Implementation: On Submit, add the details to the SQLLite DB
//     Implement a way to add image to DB
//     Get the location on button click
//     Get the system current time and date