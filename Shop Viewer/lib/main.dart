import 'package:flutter/material.dart';
import 'package:http_demo/screens/Main_screen.dart';

void main() {
  runApp( HttpApp());
}

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: MainScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}


