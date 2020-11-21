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
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 80),
                  Image.asset('assets/travel.png'),
                  //for text login
                  //SizedBox(height:40),
                  //Text('Login Page',style:TextStyle(fontSize:25,color: Colors.greenAccent),)
                ],
              ),
              SizedBox(
                height: 60.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              TextField(
                //for password to be hidden
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true,
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  ButtonTheme(
                    height: 50,
                    disabledColor: Colors.blueAccent,
                    child: FloatingActionButton.extended(
                        label: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        }),
                    //   child: RaisedButton(
                    //     child:Text('Login',style:TextStyle(color:Colors.white,),),
                    //     onPressed:(){
                    //       Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()),
                    //       );
                    //     },
                    // ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('New User? Sign up here')
                ],
              )
            ]),
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
