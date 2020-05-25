import 'package:flutter/material.dart'; 
import 'pages/HomePage.dart'; 


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "CBE Birr", 
      theme: ThemeData(
        primaryColor: Colors.purple, 
      ),
      home: HomePage(),
    );
  }

}