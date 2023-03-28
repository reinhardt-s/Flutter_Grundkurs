# Flutter AFAIK Quiz App

![AFAIK App](../afaik_app.png)

Diese Flutter App besteht aus einer Quiz-Anwendung namens "AFAIK" (As Far As I Know). Es verwendet Material Design und zeigt multiple-choice-Fragen, bei denen der Benutzer zwischen "Stimmt" (wahr) und "Stimmt nicht" (falsch) wählen kann. Die Antworten des Benutzers werden am oberen Bildschirmrand angezeigt.

## Hauptbestandteile der App

- **AfaikApp**: Ein `StatelessWidget`, das als Hauptanwendung dient.
- **AfaikPage**: Ein `StatefulWidget`, das die Hauptseite der App darstellt.
- **_AfaikPageState**: Der Zustand von `AfaikPage`. Es verwaltet die Antworten und den `QuizMaster`.

## Logik

- Die App verwendet die `QuizMaster`-Klasse, um Fragen und Antworten zu verwalten.
- Die Methode `_checkAnswer` überprüft die vom Benutzer ausgewählte Antwort und fügt entweder ein grünes Häkchen (wenn die Antwort korrekt ist) oder ein rotes X (wenn die Antwort falsch ist) zur Antwortliste hinzu.
- Die Methode `nextQuestion` von `QuizMaster` wird aufgerufen, um zur nächsten Frage zu