# Kapitel 4 - Programmlogik III

## Was wir lernen
 * Vertiefung:
    * Listen
    * if-else Verzweigungen (Conditionals)
 * Klassen
 * Abstraktion
 * Verkapselung
 * Vererbung
 * Polymorphismus

## Was wir programmieren

| AFAIK - "As far as I know" ist eine App in der die Spieler:in ihr Wissen durch beantworten von Fragen prüfen kann |
|------------------------------------------------------------------------------------|
|  <img src="afaik_app.png" height="300">  |

## AFAIK Step 1 - Initialisierung

* Für einen leichten Einstieg, kann dieser Code als Basis verwendet werden:

<details>
<summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AfaikApp());
}

class AfaikApp extends StatelessWidget {
  const AfaikApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AFAIK',
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
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'AFAIK steht für "As far as I know" und bedeutet "soweit ich weiß".',
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
                onPressed: () {},
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
                onPressed: () {},
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


```

</details>

## AFAIK Step 2 - Antwortübersicht

* Füge über der Frage eine `Row`, sowie einen `Divider` hinzu.  
In der `Row` wollen wir später mit `Icons` anzeigen, ob die Antwort richtig oder falsch war.  
Gib der `Row` links und rechts ein Padding von 16.0, von oben eines von 8.0.

<details>
<summary>Lösung</summary>

```dart
Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
    ),
),
Divider(
    thickness: 2,
),
```

</details>

* Jetzt da wir eine `Row` für unsere Antworten haben, können wir unter `children` `Icons` hinzufügen:

```dart
children: [
    Icon(
        Icons.check,
        color: Colors.green,
    ),
    Icon(
        Icons.close,
        color: Colors.red,
    ),
    Icon(
        Icons.check,
        color: Colors.green,
    ),
    Icon(
        Icons.close,
        color: Colors.red,
    ),
    Icon(
        Icons.check,
        color: Colors.green,
    ),
    Icon(
        Icons.close,
        color: Colors.red,
    ),
],
```

* Überlege jetzt, wie du die Icons dynamisch hinzufügen kannst. Dazu kannst du dir noch einmal die `List` Klasse anschauen.

<details>
<summary>Lösung</summary>

```dart
List<Widget> _answers = [];
```
Wir können nun anstelle der Icons unter `children` nun diese `List` verwenden:

```dart
children: _answers,
```

Das geht, da children eine `List` von `Widget` erwartet.
</details>


* Nun müssen wir nur noch die Icons hinzufügen, wenn die Nutzer:in auf einen der Buttons drückt. Dazu müssen wir die `onPressed` Funktionen der Buttons anpassen:

```dart
onPressed: () {
    setState(() {
        _answers.add(
            Icon(
                Icons.check,
                color: Colors.green,
            ),
        );
    });
},
```
* Da wir bei jedem drücke eines Buttons, egal ob die Nutzerin nun auf "Stimmt" oder "Stimmt nicht" drückt prüfen wollen, ob die Antwort richtig ist, ist es sinnvoll, die Prüfung in eine eigene Funktion auszulagern:

* Wie könnte eine solche Funktion aussehen?
  - Benötigt sie Parameter?
  - Was soll sie zurückgeben?
  - Und was passiert in der Funktion?

<details>
<summary>Lösung</summary>

```dart
void _checkAnswer(bool answer) {
    setState(() {
        if (answer) {
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
    });
}
```
Diese vorläufige Version prüft nur, ob die übergebene Antwort `true` also wahr ist oder nicht. Die eigentliche Logik zur Prüfung der Antwort wird, erarbeiten wir später.

</details>

* Wo und wie müssen wir nun die Funktion aufrufen?

<details>
<summary>Lösung</summary>

```dart
// Stimmt Button
onPressed: () {
    _checkAnswer(true);
},

// Stimmt nicht Button
onPressed: () {
    _checkAnswer(false);
},
```
Wir rufen die Funktion nun auf, wenn die Nutzer:in auf einen der Buttons drückt.

</details>

Dein Code sollte nun so aussehen:

<details>
<summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AfaikApp());
}

class AfaikApp extends StatelessWidget {
  const AfaikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AFAIK',
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

  List<Widget> _answers = [];

  void _checkAnswer(bool answer) {
    setState(() {
      if (answer) {
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
                    'AFAIK steht für "As far as I know" und bedeutet "soweit ich weiß".',
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

```

</details>

### AFAIK Step 3: Liste mit Fragen und Antworten

Die App soll nach dem Start und nach jeder Antwort eine neue Frage anzeigen. Dazu benötigen wir eine Liste mit Fragen.

* Erstelle eine Liste `_questions` mit Fragen. Du kannst dir hierfür die unten stehenden Fragen verweden oder eigene Fragen erstellen.

| Frage | Richtig/Falsch |
| --- | --- |
| AFAIK steht für "As far as I know" und bedeutet "soweit ich weiß". | Richtig |
| Kassel ist die Waschbärenhauptstadt Europas. | Richtig |
| In der Nordsee gibt es keine Haie. | Falsch |
| Durchschnittlich isst der Mensch acht Spinnen im Schlaf. | Falsch |
| Hühner können nicht fliegen. | Falsch |
| Löwen springen bis zu 10 Meter weit. | Richtig |

<details>
<summary>Lösung</summary>

```dart
List<String> _questions = [
    'AFAIK steht für "As far as I know" und bedeutet "soweit ich weiß".',
    'Kassel ist die Waschbärhauptstadt Europas.',
    'In der Nordsee gibt es keine Haie.',
    'Durchschnittlich isst der Mensch acht Spinnen im Schlaf.',
    'Hühner können nicht fliegen.',
    'Löwen springen bis zu 10 Meter weit.',
];
```
</details>

Ersetze nun die Frage in der App durch die erste Frage aus der Liste.

<details>
<summary>Lösung</summary>

```dart
Text(
    _questions[0],
    ...
),
```
</details>

Um zu wissen, welche Frage wir als nächstes anzeigen, benötigen wir eine Variable, die den Index der aktuellen Frage speichert.


* Erstelle eine Variable `_currentQuestionIndex`, die den Index der aktuellen Frage speichert.

<details>
<summary>Lösung</summary>

```dart
int _currentQuestionIndex = 0;
```
</details>

* Wo und wie wird die Variable verwendet?

<details>
<summary>Lösung</summary>
Die Variable wird in der Methode `_checkAnswer(bool answer)` verwendet, um den Index der nächsten Frage zu bestimmen.

Beachte, das for dem Anzeigen der nächsten Frage der Index um eins erhöht werden muss.
</details>

#### Erhöhen von Variablen
```dart
int counter = 0;
// Um eine Variable um einen bestimmten Wert zu erhöhen, kann der Operator += verwendet werden.

// Erhöht die Variable um 1
counter += 1;
print(counter); // 1

// Erhöht die Variable um 2
counter += 2;
print(counter); // 3

// Da Werte besonder häufig um 1 erhöht bzw. verringert werden, gibt es auch die verkürzten Operatoren ++ und --.

// Erhöht die Variable um 1
counter++; 
print(counter); // 4

// Verringert die Variable um 1
counter--; 
print(counter); // 3
```

* Passe die Funktion `_checkAnswer(bool answer)` und das `Text`-Widget so an, sodass die nächste Frage angezeigt wird.

<details>
<summary>Lösung</summary>

```dart
  void _checkAnswer(bool answer) {
    setState(() {
      if (answer) {
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
```
</details>



Wenn wir nun die App testen, wird uns bei jedem Klick auf den Button "Stimmt" oder "Stimmt nicht" eine neue Frage angezeigt. Allerdings wird die App nach der letzten Frage abstürzen: `Range error (index): Invalid value: Not in range 0..5, inclusive: 6`.  
Wir versuchen also, die Frage mit dem Index 6 aus der Liste zu laden, obwohl die der Index nur von 0 bis 6 geht.

Dieses Problem werden wir später lösen.

#### List mit Antworten
Wir haben in Schritt drei eine Liste mit Fragen erstellt. Um zu prüfen ob die gegebenen Antworten richtig oder falsch sind, benötigen wir eine Liste mit Antworten.

* Lege eine Liste `_correctAnswers` an, die die Antworten richtige Antworten enthält.

<details>
<summary>Lösung</summary>

```dart
List<bool> _correctAnswers = [
    true,
    true,
    false,
    false,
    false,
    true,
];
```
</details>

Nun können wir in den Funktion `checkAnser(bool answer)`überprüfen, ob die gegebene Antwort richtig oder falsch ist und das entsprechende Icon setzen.

* Passe die Funktion `_checkAnswer(bool answer)` so an, dass die richtige Antwort aus der Liste `_correctAnswers` verwendet wird.

Du kannst die vorhandenen Logik verwenden und erweitern. 

Hinweis: Wenn du zwei Variablen vergleichen möchtest, kannst du das genau so machen wie in den Beispielen aus Kapitel 3; mit dem Gleichheits-Operator `==`.

```dart
bool userAnswer = true;
bool correctAnswer = true;

// Prüft ob die beiden Variablen den gleichen Wert haben
if (userAnswer == correctAnswer) {
    print('Die Antwort ist richtig');
} else {
    print('Die Antwort ist falsch');
}
```

<details>
<summary>Lösung</summary>

```dart
  void _checkAnswer(bool answer) {
    setState(() {
      if (answer == _correctAnswers[_currentQuestionIndex]) {
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
```
</details>


### Klassen

Zwar können wir nun prüfen, ob die gegebene Antwort richtig oder falsch ist, allerdings ist das Pflegen zweier Listen sehr Fehler anfällig. Sollte eine Frage aus der Liste gestrichen werden so muss auch genau die richtige Antwort aus der Liste entfernt werden.

Um das zu verhindern, können wir eine Klasse erstellen, die die Frage und die Antwort beinhaltet.
Ähnlich wie die uns bekannten Widgets, welche Eigenschaften und Methoden haben, können wir auch eigene Klassen erstellen, die Eigenschaften und Methoden haben.

* Erstelle eine neue Dart-Datei `question.dart` im Ordner `lib`.

In dieser Datei erstellen wir eine neue Klasse `Question`.

```dart
class Question {
    
}
```

Eine neue Klasse wird mit dem Schlüsselwort `class` erstellt.
Der Name der Klasse folgt auf das Schlüsselwort `class` und fängt mir einem Großbuchstaben an.

Der Klasse geben wir nun die beiden Eigenschaftten, die wir hier hin auslagern wollten:

```dart
class Question {
    String question = "";
    bool answer = false;
}
```

Als nächste erstellen wir einen Konstruktor, der die Eigenschaften der Klasse initialisiert.
Wir geben den Parametern des Konstruktors Standardwerte mit, sodass diese immer gesetzt sind.

```dart
class Question {
    String question = "";
    bool answer = false;

    Question({String q="", bool a=false}) {
        question = q;
        answer = a;
    }
}
```

Der Konstruktor wird mit dem Namen der Klasse und den Parametern der Klasse erstellt.
Dieser wird aufgerufen, wenn eine neue Instanz der Klasse erstellt wird.

* Gehe wieder zu DartPad (https://dartpad.dartlang.org/) und kopiere folgenden Code in das DartPad.

```dart
// Erstellen einer Klasse
class Question {
    // Eigenschaften der Klasse
    String question = "";
    bool answer = false;

    // Konstruktor der Klasse
    Question({String q="", bool a=false}) {
        question = q;
        answer = a;
    }

    Questtion(String q, bool a) {
        question = q;
        answer = a;
    }

}


void main() {

  // Antwort der Nutzer:in
  bool userAnswer = false;

  // Neues Objekt der Klasse Question
  Question q1 = Question(q: 'Schweine können nicht fliegen.', a: true);

  // Keine Antwort angegeben. Es wird der hinterlegte Standardwert (false) verwendet.
  Question q2 = Question(q: 'Mehr als vier Tassen Kaffee am Tag sind tödlich.');

  // Verwendet den zweiten Koknstruktor der Klasse Question
  Question q3 = Question('Faultiere können ihren Atem länger anhalten als Delphine', true);
  
  // Ausgabe der Fragen und Antworten
  print(q1.question);
  print(q1.answer);

  print(q2.question);
  print(q2.answer);
  
  // Prüfen der Antworten
  if ( userAnswer == q1.answer) {
    print('Richtig getippt!');
  } else {
    print('Da liegst du leider falsch.');
  }

  if ( userAnswer == q2.answer) {
    print('Richtig getippt!');
  } else {
    print('Da liegst du leider falsch.');
  }
  
}
```
Um in userer App auf die Klassen `Question` zuzugreifen, müssen wir diese in die Datei `main.dart` importieren.

* Füge folgenden Code am Anfang der Datei `main.dart` ein.

```dart
import 'question.dart';
``` 

* Erstelle nun ein Question-Objekt für die erste Frage und speichere es in der Variable `q1`.

```dart
Question q1 = Question(q: 'AFAIK steht für "As far as I know" und bedeutet "soweit ich weiß".', a: true);
```

* Passe deinen Code so an, dass die Liste `_questions` aus Objekten der Klasse `Question` besteht.

<details>
<summary>Lösung - Gesamter Code</summary>

```dart
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
    Question(q: 'Kassel ist die Waschbärenhauptstadt Europas.', a: true),
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

```
</details>

### Klassen II

* Kopiere folgenden Code in ein neues DartPad:
  
  <details>
  <summary>Code</summary>

  ```dart
  // Erstellen der Klasse Auto
  // Ein Auto hat Eigentschaften wie: Farbe, Anzahl der Türen, Max. Geschwindigkeit
  // Es hat ebenfall Fähigkeiten wie: Beschleunigung, Richtung wechseln

  // Deklariert die Klasse
  class Car{
    
    // Eigenschaften (Properties / Fields) des Autos
    String _color = 'weiß';
    String _name = 'Auto';
    int _doors = 3;
    int _currentSpeed = 50;
    
    int _trunkWeight = 0;
    int _passengers = 0;
    
    // Konstruktor der Klasse.
    // Wird aufgerufen um eine neue Instanz (ein neues Objekt) vom Typ Auto anzulegen
    // Sie heißen, wie de Klasse, können nach belieben Parameter aufnehmen, haben jedoch keinen Rückgabewert.
    Car(int doors, String color) {
      _doors = doors;
      _color = color;
    }
    
    // Konstruktoren können benamt werden. 
    // Das benamen erfolgt durch das Anhängen eines Punktes und des Namens
    Car.d(int doors) {
      _doors = doors;
    }
    
    // Das Fragezeichen gibt an, dass dieser Parameter optional ist
    // Da er keinen Standardwert hat, ist der Parameter "leer", also null
    // Wenn keiner an den Konstruktor übergeben wird.
    Car.name(String color, int doors, {String? name}){
      _color = color;
      _doors = doors;
      
      // Diese Zeile sorg für einen Fehler, da wir noch nicht geprüft haben,
      // ob der Wert in name evtl null ist.
      //_name = name;
      
      // Bin ich mir sicher, dass der Wert nicht null sein kann,
      // kann ich die Zuweisung erzwingen
      //_name = name!;
      
      // Weil wir prüfen, ob der Wert null ist, können wir ihn normal verwenden.
      if ( name != null) {
        _name = name;
        print('Mein Name ist $_name');
      } else {
        print('Mir wurde kein Name gegeben.');
      }
    }
    
    // Fähigkeiten des Autos (Methods)
    void getStatus() {
      print('Das Auto hat $_doors Türen, ist $_color und fährt $_currentSpeed km/h.');
    }
    
    // Eine Funktion mit dem Parameter passenger
    void addPassengerWithLuggage(int passengers, int luggage){
      _passengers += passengers;
      _trunkWeight += luggage;
    }
    
    // Eine Funktion mit dem benamten Parameter weight, welche standardmäßig auf 0 gesetzt ist
    void removeFromTrunk({int weight = 10}){
      _trunkWeight -= weight;
    }
    
    // Eine Funktion mit dem benamten Parameter weight, dessen Angabe verpflichtend ist.
    void addToTrunk({required int weight}) {
      _trunkWeight += weight;
    }
    
    // Eine Funktion die die Anzahl an Passagieren als Wert zurück gibt;
    int getPassengerCount() {
      // return wird benutzt um anzugeben, was die Funktion zurückgeben soll.
      return _passengers;
    }
    
    void getWeight() {
      print('Im Kofferraum befinden sich $_trunkWeight kg Gepäck');
    }
  }

  void main() {
    Car volvo = Car(5, 'schwarz');
    volvo.getStatus();
    
    Car kia = Car.d(2);
    kia.getStatus();
    
    print(kia._doors);
    kia.getWeight();
    
    
    // In der Funktionsdeklaration wurde passengers als positional Parameter angegeben
    // Das heißt, die Werte werden in der gleichen Reihenfolge zugewiesen, wie sie übergeben
    // werden.
    // Wir fügen also zwei Passagiere mit insg. 50 kg Gepäck hinzu.
    kia.addPassengerWithLuggage(2, 50);
    kia.getWeight();
    print(kia.getPassengerCount());
    
    
    // In den geschweiften Klammern, der Funktionsdeklaration
    // stehen Parameter, welche mit Namen angesprochen werden
    // required gibt an, dass dieser wird zwingend übergeben werden muss
    kia.addToTrunk(weight:20);
    kia.getWeight();
    
    // Werte in geschweiften Klammer können einen Standardwert haben.
    // Wenn dieser Wert nicht bei Funktionsaufruf gesetzt wird, wird der Standardwert verwendet.
    // Entfernt 20 kg aus dem Kofferraum
    kia.removeFromTrunk();
    kia.getWeight();
    
    kia.removeFromTrunk(weight: 5);
    kia.getWeight();
    
    Car bmw = Car.name('blau', 5);
    Car fiat = Car.name('blau', 5, name: 'Fiat 500');
  }
  ```

  </details>


Wir besprechen den Code zusammen.


### Abstraktion

Um die Komplexität aus unserer Anwendung zu halten, lagern wir Code der logisch zusammen gehört in Klassen aus.

* Erstelle in einer neuen Datei `quiz_master.dart` eine neue Klasse `QuizMaster`.
* Schneide die Liste mit den Fragen aus der `main.dart` und füge sie in die Klasse `QuizMaster` ein.
  * Dir sollte nun einiges rot markiert sein. Das liegt daran, dass wir die Klasse `Question` noch nicht importiert haben. Füge die import-Zeile noch hinzu.

Dein Code sollte nun so aussehen:

<details>
<summary>Code: `quiz_master.dart`</summary>

```dart
import 'question.dart';

class QuizMaster {
  List<Question> questions = [
    Question(q: 'AFAIK steht für "As far as I know" und bedeutet "soweit ich weiß".', a: true),
    Question(q: 'Kassel ist die Waschbärenhauptstadt Europas.', a: true),
    Question(q: 'In der Nordsee gibt es keine Haie.', a: false),
    Question(q: 'Durchschnittlich isst der Mensch acht Spinnen im Schlaf.', a: false),
    Question(q: 'Hühner können nicht fliegen.', a: false),
    Question(q: 'Löwen springen bis zu 10 Meter weit.', a: true),
    Question(q: 'Es ist unmöglich zu summeen, während man sich die Nase zu hält.', a: true),
    Question(q: 'Oktopoden haben drei Herzen.', a: true),
    Question(q: 'In Münster gibt es mehr Fahrräder als Einwohner.', a: true),
    Question(q: 'Waschbären können nicht schwimmen.', a: false),
    Question(q: 'Die größte Insel der Welt ist Neuguinea.', a: false),
  ];
}
```
</details>

Durch das Löschen der Zeilen in der `main.dart` haben wir dort einige Fehler erzeugt, die wir nun korrigieren müssen.

* Lösche den Import der Klasse `Question` aus der `main.dart`.
* Importiere die Klasse `QuizMaster` in der `main.dart` und erstelle ein Objekt der Klasse.
* Korrifiere die folgenden Zeile so, dass Sie nun die Liste der Fragen aus der Klasse `QuizMaster` beziehen.
  ```dart
    ...
    if (answer == _questions[_currentQuestionIndex].questionAnswer) {
    ...
    _questions[_currentQuestionIndex].questionText,
    ...
  ```

### Einkapselung

In einem gut organisiertem Restaurant, gibt es verschiedene Mitarbteiter, die verschiedene Aufgaben erfüllen.
Die Kellner:in nimmt die Bestellung auf und die Köch:in bereitet das Essen zu.
Auf diese Weise kann sich jede Person auf ihre Aufgabe konzentrieren und muss sich nicht mit den Aufgaben der anderen beschäftigen.

In der Programmierung ist es ähnlich. Wir wollen, dass unsere Klassen nur die Aufgaben erfüllen, die sie erfüllen sollen.

Unsere Datei `main.dart` ist zur Zeit noch in der Lage, die Fragen zu verändern. 
Das ist jedoch nicht der Job der `main.dart`.
Wir müssen also eine Wand zwischen den beiden Klassen schaffen und den Zugriff auf die Fragen, gezielt nach Bedürfnis steuern.

Wir fangen damit an, das wir die Liste der Fragen `private` machen. Das heißt, dass wir die Liste nur innerhalb der Klasse `QuizMaster` verwenden können.
Die erreichen wir durch das Hinzufügen eines Unterstrichs vor den Namen der Liste.

<details>
<summary>Code</summary>

  ```dart
    List<Question> _questions = [
  ```
</details>

In der `main.dart` können wir nun nicht mehr auf die Liste der Fragen zugreifen, was uns Android Studio durch das rot markieren der Zeilen anzeigt.
Wir müssen also eine Methode schreiben, die uns die Fragen zurück gibt.

Was wir genau wollen, ist eine Methode die uns direkt eine Frage zurück gibt.

* Erstelle drei neue Methoden:
  * `getQuestionText()` - Gibt den Text der Frage zurück.
  * `getQuestionAnswer()` - Gibt die Antwort der Frage zurück.
  * `nextQuestion` - Setzt den Index der aktuellen Frage auf die nächste Frage.

* Wir brauchen nun auch die Variable `_currentQuestionIndex` in der `main.dart` nicht mehr.
* Passe nun die `main.dart` so an, dass sie die Methoden der Klasse `QuizMaster` nutzt.

<details>
<summary>Lösung - Code: `main.dart`</summary>

```dart
import 'package:flutter/material.dart';
import 'quiz_master.dart';

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
  List<Widget> _answers = [];
  QuizMaster _quizMaster = QuizMaster();





  void _checkAnswer(bool answer) {
    setState(() {
      if (answer == _quizMaster.getQuestionAnswer()) {
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
      _quizMaster.nextQuestion();
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
                    _quizMaster.getQuestionText(),
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
```
</details>

<details>
<summary>Lösung - Code: `quiz_master.dart`</summary>

```dart
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
        q: 'Es ist unmöglich zu summeen, während man sich die Nase zu hält.',
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
      _currentQuestionIndex++;
  }
}
```
</details>

* Schreibe die Methode `nextQuestion()` so um, dass sie die Variable `_currentQuestionIndex` auf den Index der nächsten Frage setzt. Wenn die aktuelle Frage die letzte Frage ist, soll die Variable auf den Index der ersten Frage gesetzt werden.
  * Tipp: Du kannst die Länge der Liste mit der Eigenschaft `length` abfragen.
  * Verwende if-else-Statements, um zu prüfen, ob die aktuelle Frage die letzte Frage ist.

<details>
<summary>Lösung</summary>

```dart
void nextQuestion() {
  if (_currentQuestionIndex < _questions.length - 1) {
    _currentQuestionIndex++;
  } else {
    _currentQuestionIndex = 0;
  }
}
```

</details>

### Vererbung
Vererbung ist ein grundlegendes Konzept der objektorientierten Programmierung (OOP), 
das es erlaubt, Code wiederverwendbar, modular und leicht verständlich zu gestalten. 
Es ermöglicht, dass eine Klasse (ein Bauplan für Objekte) die Eigenschaften und Methoden einer anderen Klasse erbt, 
ohne den Code dafür neu schreiben zu müssen. Die Hauptakteure in diesem Prozess sind die Basisklasse 
(auch als "Superklasse" bezeichnet) und die abgeleitete Klasse (auch als "Subklasse" bezeichnet).

Gehe wieder auf [dartpad.dev](https://dartpad.dev) und kopiere den folgenden Code in das Textfeld:

<details>
<summary>Code</summary>

```dart
class Vehicle {
  int maxSpeed = 80;
  String drive = 'Verbrenner';
  
  void accelerate() {
    print('Trete auf das Gas-Pedal');
  }
}

class ECar extends Vehicle {
  
  String drive = 'E-Motor';
  
  void charge() {
    print('Lade Batterie auf...');
  }
}


void main() {
  Vehicle car = Vehicle();
  print(car.maxSpeed);
  print(car.drive);
  car.accelerate();

  ECar ecar = ECar();
  print(ecar.maxSpeed);
  print(ecar.drive);
  ecar.accelerate();
  ecar.charge();  
}
```
</details>

Wir besprechen den Code gemeinsam.

### Polymorphie
Polymorphie ist ein weiteres Schlüsselkonzept der objektorientierten Programmierung (OOP). 
Es erlaubt, dass Methoden in abgeleiteten Klassen die gleiche Signatur wie Methoden in der Basisklasse haben, 
aber unterschiedliche Implementierungen aufweisen. Polymorphie ermöglicht es, dass eine Methode auf 
erschiedene Arten implementiert wird, je nachdem, welches Objekt sie aufruft. Dadurch wird der Code flexibler 
und leichter erweiterbar.

Gehe wieder auf [dartpad.dev](https://dartpad.dev) und ergänze die Klasse Quad. Ergänze ebenfalls die Aufrufe, analog `car`.

<details>
<summary>Code</summary>

```dart
class Quad extends Vehicle {
    
  @override
  void accelerate() {
    print('Drehe am Hebel');
  }

}

//...

Quad quad = Quad();
print(quad.maxSpeed);
print(quad.drive);
quad.accelerate();

```
</details>

Wir besprechen den Code gemeinsam.

Durch `@override` wird die Methode der Basisklasse überschrieben.

Ergänze den Code um die Klasse SDCar, erzeuge ein SDCar-Objekt und rufe die Methode `accelerate()` auf:

<details>
<summary>Code</summary>

```dart
  class SDCar extends Vehicle {
  String destination = 'Nach Hause';
  
  SDCar(String userDestination){
    destination = userDestination;
  }
  
  @override
  void accelerate() {
    super.accelerate();
    print('Beschleunige Richtung $destination');
  }
}
//...
  SDCar sdc = SDCar('Hamburg');bb
  sdc.accelerate();
```
</details>

Mit `super` kann auf die Methode der Basisklasse zugegriffen werden.
