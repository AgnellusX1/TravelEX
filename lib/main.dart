import 'package:flutter/material.dart';
import 'file:///F:/Academics/Projects/Android/travel_ex/lib/services/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}