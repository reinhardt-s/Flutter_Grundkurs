import 'question.dart';

class QuizMaster {
  List<Question> _questions = [
    Question(
        q: 'AFAIK steht für "As far as I know" und bedeutet "soweit ich weiß".',
        a: true),
    Question(q: 'Kassel ist die Waschbärenhauptstadt Europas.', a: true),
    Question(q: 'In der Nordsee gibt es keine Haie.', a: false),
    Question(
        q: 'Durchschnittlich isst der Mensch acht Spinnen im Schlaf.',
        a: false),
    Question(q: 'Hühner können nicht fliegen.', a: false),
    Question(q: 'Löwen springen bis zu 10 Meter weit.', a: true),
    Question(
        q: 'Es ist unmöglich zu summen, während man sich die Nase zu hält.',
        a: true),
    Question(q: 'Oktopoden haben drei Herzen.', a: true),
    Question(q: 'In Münster gibt es mehr Fahrräder als Einwohner.', a: true),
    Question(q: 'Waschbären können nicht schwimmen.', a: false),
    Question(q: 'Die größte Insel der Welt ist Neuguinea.', a: false),
  ];

  int _currentQuestionIndex = 0;

  String getQuestionText() {
    return _questions[_currentQuestionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_currentQuestionIndex].questionAnswer;
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    } else {
      _currentQuestionIndex = 0;
    }
  }
}
