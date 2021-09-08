import 'package:flutter/material.dart';
import 'package:freshbasketr/testpage.dart';
// import 'package:freshbasketr/widgets/product_grid.dart';
// import 'package:freshbasketr/widgets/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: TestPage(),
//      initialRoute: '/',
//      routes: {
//
//      },
    );
  }
}
