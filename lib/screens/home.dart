import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  showAlertDialog(BuildContext context, int index) {
    Widget cancelButton = FlatButton(
      child: Text("Go back"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Its Okay"),
      onPressed: () {
        ReadBox.deleteAt(index);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("You sure, You may miss it ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(
          //       Icons.search,
          //       color: Colors.white,
          //     ),
          //   )
          // ],
          title: Text("TravelEX",style: GoogleFonts.pacifico(),),
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
                        final memory = ReadBox.getAt(index) as Model;
                        return GestureDetector(
                          onLongPress: () {
                            //  Delete the Card

                            showAlertDialog(context, index);

                            //   ReadBox.deleteAt(index);
                          },
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(memory.title,style: GoogleFonts.lobster(),),
                                  subtitle: Text(
                                    memory.dateTime,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.location_on_rounded),
                                        onPressed:(){
                                        //  Open Maps and Show the Location
                                        },
                                      ),
                                      Text(memory.location)
                                    ],
                                  ),
                                ),
                                Center(
                                  child: memory.image == null
                                      ? Text("No Image was added")
                                      : Image.memory(
                                          base64Decode(memory.image)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    memory.description,
                                    style: GoogleFonts.dancingScript(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
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
