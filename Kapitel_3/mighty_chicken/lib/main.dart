import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MightyChickenApp());
}

class MightyChickenApp extends StatelessWidget {
  const MightyChickenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mighty Chicken',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MightyChickenPage(),
    );
  }
}

class MightyChickenPage extends StatefulWidget {
  const MightyChickenPage({super.key});

  @override
  State<MightyChickenPage> createState() => _MightyChickenPageState();
}

class _MightyChickenPageState extends State<MightyChickenPage> {
  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  List<String> _hayStacks = [];
  int _chickenPosition = 0;


  void _resetGame() {
    setState(() {
      _hayStacks = [
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
        'assets/images/hay_stack.png',
      ];
      _chickenPosition = Random().nextInt(12);
    });
  }

  void _revealHayStack(int hayStack) {
    AudioPlayer player = AudioPlayer();
    setState(() {
      print('Haystack $hayStack revealed!');
      if (hayStack == _chickenPosition) {
        print('Chicken found!');
        player.play(AssetSource('sounds/chicken.mp3'));
        _hayStacks[hayStack] = 'assets/images/mighty_chicken.png';
      } else {
        player.play(AssetSource('sounds/cicada.mp3'));
        _hayStacks[hayStack] = 'assets/images/nothing.png';
      }
    });
  }

  Widget _buildHayStack(int hayStack) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      onPressed: () => _revealHayStack(hayStack),
      child: Card(
        elevation: 8,
        child: ClipRRect(
            child: Image.asset(_hayStacks[hayStack]),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('Mighty Chicken'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 3,
                  children: <Widget>[
                        _buildHayStack(0),
                        _buildHayStack(1),
                        _buildHayStack(2),
                        _buildHayStack(3),
                        _buildHayStack(4),
                        _buildHayStack(5),
                        _buildHayStack(6),
                        _buildHayStack(7),
                        _buildHayStack(8),
                        _buildHayStack(9),
                        _buildHayStack(10),
                        _buildHayStack(11),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextButton(
                  onPressed: () => _resetGame(),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Neues Spiel",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.amber),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
