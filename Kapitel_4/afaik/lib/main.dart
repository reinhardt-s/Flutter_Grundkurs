import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const AfaikApp());
}

class AfaikApp extends StatelessWidget {
  const AfaikApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AfaikPage(),
    );
  }
}

class AfaikPage extends StatefulWidget {
  const AfaikPage({super.key});

  @override
  State<AfaikPage> createState() => _AfaikPageState();
}

class _AfaikPageState extends State<AfaikPage> {

  int _currentQuestionIndex = 0;
  List<Widget> _answers = [];

  List<Question> _questions = [
    Question(q: 'AFAIK steht für "As far as I know" und bedeutet "soweit ich weiß".', a: true),
    Question(q: 'Kassel ist die Waschbärhauptstadt Europas.', a: true),
    Question(q: 'In der Nordsee gibt es keine Haie.', a: false),
    Question(q: 'Durchschnittlich isst der Mensch acht Spinnen im Schlaf.', a: false),
    Question(q: 'Hühner können nicht fliegen.', a: false),
    Question(q: 'Löwen springen bis zu 10 Meter weit.', a: true),
  ];



  void _checkAnswer(bool answer) {
    setState(() {
      if (answer == _questions[_currentQuestionIndex].questionAnswer) {
        _answers.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        _answers.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('AFAIK'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _answers,
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    _questions[_currentQuestionIndex].questionText,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                thickness: 2,
              ),
            ),
            // Stimmt Button
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
              child: TextButton(
                onPressed: () => _checkAnswer(true),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.green,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'Stimmt',
                      style:
                          TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            // Stimmt nicht Button
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              child: TextButton(
                onPressed: () => _checkAnswer(false),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'Stimmt nicht',
                      style:
                          TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
