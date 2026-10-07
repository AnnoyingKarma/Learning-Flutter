import 'package:flutter/material.dart';
import 'package:recipe_book/screens/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Unbounded'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}