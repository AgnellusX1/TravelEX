import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:travel_ex/dbconnect/model.dart';
import 'package:travel_ex/screens/add.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Box ReadBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadBox = Hive.box('adventure');
  }

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
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: ReadBox.listenable(),
                  builder: (context, Box ReadBox, _) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final memory=ReadBox.getAt(index) as Model;



                        return Card(

                          child: ListTile(

                            title: Text(
                              //This is the Title
                              memory.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            subtitle: Text(
                              //This is the date
                              memory.dateTime,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            // isThreeLine: Text(
                            // //  This is the loaction
                            //   location,
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold, fontSize: 16),
                            // ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) => Divider(),
                      itemCount: ReadBox.length,
                    );
                  },
                ),
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
