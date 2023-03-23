import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const FeedMePage());
}

class FeedMePage extends StatefulWidget {
  const FeedMePage({Key? key}) : super(key: key);

  @override
  State<FeedMePage> createState() => _FeedMePageState();
}

class _FeedMePageState extends State<FeedMePage> {
  int diceThrow = 1;

  updateDice() {
    setState(() {
      diceThrow = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed Me',
      home: Scaffold(
        backgroundColor: Color(0xffba2323),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFC300),
          title: Text(
            'Feed Me',
            style: TextStyle(
                color: Color(0xffba2323), fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Card(
              color: Color(0x00),
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          child: Image.asset('assets/images/diner_$diceThrow.png'),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      )),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {updateDice();
                    },
                    child: Text(
                      'Starte Suche',
                      style: TextStyle(
                          color: Color(0xFFFFC300),
                          fontSize: 35.0,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto_Slab'),
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
