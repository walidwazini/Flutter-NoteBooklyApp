import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './Screens/HomeScreen.dart';
import './Provider/TasksProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: MaterialApp(
        theme: ThemeData(
          // primaryColor: Color(0xff1e00b7),
          primaryColor: Color(0xff0c4fd2),
          scaffoldBackgroundColor: Color(0xffececec),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
