import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('My Pastries'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Image.asset('assets/images/pastry_bg.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,),
        ),
      ),
    ),
  );
}