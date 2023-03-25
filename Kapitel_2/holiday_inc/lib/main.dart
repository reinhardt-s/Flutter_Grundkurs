import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const HolidayIncApp());
}

class HolidayIncApp extends StatelessWidget {
  const HolidayIncApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holiday Inc.',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFFFFA726)),
      ),
      home: const HolidayPage(),
    );
  }
}

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  int _weeks = 2;
  int _destination = 1;
  int _cost = 1000;
  void _planHolidays() {
    setState(() {
      _weeks = Random().nextInt(4) + 2;
      _destination = Random().nextInt(5) + 1;
      _cost = Random().nextInt(2000) + 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Center(
            child: Text('Holiday Inc.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    fontFamily: 'Pacifico')),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Verreise $_weeks Wochen für nur $_cost €',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child:
                        Image.asset('assets/images/holiday_$_destination.png'),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _planHolidays(),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Center(
                    child: Text(
                      'Jetzt Angebot finden',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
