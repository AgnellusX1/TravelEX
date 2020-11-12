import 'package:flutter/material.dart';
import 'package:travel_ex/screens/home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Login'),
          backgroundColor: Colors.lightBlue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()),
            );
          },
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

//TODO:
// Design: Need to Design the Id and pass Fields
//         Need to Design The Login Page, with the Buttons to Login Via Google, FB,etc
//
// Implementation: Need to make sure the user can't go back on login Screen, unless he logs out
//         Add Need to Integrate Firebase Auth to for Email, as well as Social Media