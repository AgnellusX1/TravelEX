import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:travel_ex/services/wrapper.dart';

import 'package:hive/hive.dart';
import 'package:travel_ex/dbconnect/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbDocument = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dbDocument.path);
  Hive.registerAdapter(ModelAdapter());
  final adventuresBox = await Hive.openBox('adventure');
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
