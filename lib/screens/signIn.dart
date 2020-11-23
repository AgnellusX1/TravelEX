import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_ex/screens/home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.red])),
          child: ListView(padding: EdgeInsets.all(18.0), children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/travelex.gif",
                  height: 250, width: 250, fit: BoxFit.fill,),
            ),
            Text(
              'TravelEX',
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(
                fontSize: 40,
                textStyle: TextStyle(color: Colors.blue, letterSpacing: .5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.grey[200])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.grey[200])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('New User? Sign up here')),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Login'),
        icon: Icon(Icons.done),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
//TODO:
// Design: Need to Design the Id and pass Fields
//         Need to Design The Login Page, with the Buttons to Login Via Google, FB,etc
//
// Implementation: Need to make sure the user can't go back on login Screen, unless he logs out
//         Add Need to Integrate Firebase Auth to for Email, as well as Social Media
