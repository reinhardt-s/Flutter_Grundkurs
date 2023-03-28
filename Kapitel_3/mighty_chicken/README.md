# Flutter Mighty Chicken App

![Mighty Chicken](../mighty_chicken_app.png)

Die Flutter Mighty Chicken App ist ein lustiges Suchspiel, bei dem der Benutzer versucht, ein verstecktes Huhn unter Heuhaufen zu finden. Bei jedem Spiel wird das Huhn zufällig unter einem der Heuhaufen platziert.

## Hauptbestandteile der App

- **MightyChickenApp**: Ein `StatelessWidget`, das als Hauptanwendung dient.
- **MightyChickenPage**: Ein `StatefulWidget`, das die Hauptseite der App darstellt.
- **_MightyChickenPageState**: Der Zustand von `MightyChickenPage`. Es verwaltet die Position des Huhns und die Heuhaufen.

## Logik

- Die Methode `_resetGame` wird verwendet, um die Heuhaufen auf ihren ursprünglichen Zustand zurückzusetzen und das Huhn zufällig unter einem der Heuhaufen zu platzieren.
- Die Methode `_revealHayStack` wird aufgerufen, wenn der Benutzer auf einen Heuhaufen tippt. Es prüft, ob das Huhn unter dem ausgewählten Heuhaufen gefunden wurde, und aktualisiert das Bild entsprechend. Außerdem wird eine Audio-Datei abgespielt, je nachdem, ob das Huhn gefunden wurde oder nicht.
- Die Methode `_buildHayStack` erstellt ein `TextButton`-Widget für jeden Heuhaufen, das mit dem entsprechenden Bild und der `onPressed`-Funktion initialisiert wird.

## Benutzeroberfläche

- Die Benutzeroberfläche besteht aus einer grünen Hintergrundfarbe und einer AppBar mit dem Titel "Mighty Chicken".

- Die Heuhaufen werden in einem 3x4-Raster (GridView.count) angeordnet. Jeder Heuhaufen ist ein TextButton-Widget, das durch die Methode _buildHayStack erstellt wird.

- Unterhalb des Rasters befindet sich ein Trennstrich (Divider), gefolgt von einem "Neues Spiel"-Button, der die _resetGame-Methode aufruft, um ein neues Spiel zu starten.

## Audio
- Die App verwendet das audioplayers-Paket, um Audiodateien abzuspielen.

- Die AudioPlayer-Instanz spielt entweder einen "chicken.mp3" (wenn das Huhn gefunden wurde) oder "cicada.mp3" (wenn das Huhn nicht gefunden wurde) Sound ab, abhängig von der Aufdeckung des Heuhaufens.
