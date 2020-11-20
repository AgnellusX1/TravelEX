import 'package:flutter/material.dart';
import 'package:travel_ex/screens/add.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
          title: Text("TravelEX"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'A Place for your Adventures:',
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Add()),
            );
          },
          label: Text('Begin a New Adventure'),
          tooltip: 'Add a New Adventure',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerDocked, // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

//TODO:
//
// Design: Design the List here that would show saved Adventures
//         Design the Skeleton card/Container that will be used to fill the list
//
// Implementation: Implement the list
//           Connect the System to the SQLLite DB
//           Implement the card view in a way that it would fetch each Adventure
