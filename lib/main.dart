import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

var x;
weather() async {
  var url =
      "http://api.openweathermap.org/data/2.5/forecast?q=${x}&appid=4614d1d4527e8ddf9075ad82e07872a0";
  var r = await http.get(url);
  var data = r.body;
  var f = jsonDecode(data);
  print(f);
}

var Mybody = Container(
  width: double.infinity,
  height: double.infinity,
  decoration: BoxDecoration(color: Colors.blue[50]),
  child: Center(
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: "enter ur city name"),
          onChanged: (value) {
            x = value;
          },
        ),
        RaisedButton(
          onPressed: weather,
          color: Colors.amberAccent,
          child: Text('City'),
        )
      ],
    ),
  ),
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("weather"),
          backgroundColor: Colors.amber,
        ),
        body: Mybody,
      ),
    );
  }
}
