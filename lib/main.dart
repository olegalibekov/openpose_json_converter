import 'package:flutter/material.dart';
import 'package:openpose_json_converter/json_converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Test());
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    jsonConverter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.cyan));
  }
}
