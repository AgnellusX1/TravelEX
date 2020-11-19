import 'package:flutter/material.dart';
import 'package:travel_ex/screens/home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(

                child: Stack(


                  children: <Widget>[
                    Positioned(
                      child: Image.asset(
                        "assets/bg.jpg",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'TravelEX',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),


                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Email Id',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Password ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 10.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 30.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),

                            ),

                          ),
                        ),

                      ),

                    ],
                  )),
              FloatingActionButton.extended(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()),
                  );
                },
                label: Text('Begin a New Adventure'),
                tooltip: 'Add a New Adventure',
              ),

            ]

        )
    );
  }
}
//TODO:
// Design: Need to Design the Id and pass Fields
//         Need to Design The Login Page, with the Buttons to Login Via Google, FB,etc
//
// Implementation: Need to make sure the user can't go back on login Screen, unless he logs out
//         Add Need to Integrate Firebase Auth to for Email, as well as Social Media
