# Feed Me - App

![Feed Me App](../feed_me_app.png)

## Beschreibung des Source Codes
1. Importieren der Pakete `flutter/material.dart` und `dart:math`.
2. Definition der `main()` Funktion, welche `FeedMePage` als Haupt-App-Widget ausführt.
3. `FeedMePage` ist ein `StatefulWidget`.
    - `_FeedMePageState` ist der zugehörige State für das `FeedMePage` Widget.
4. `_FeedMePageState` enthält die Variable `diceThrow`, die den aktuellen Wurf des Würfels speichert.
    - Die `updateDice()` Funktion aktualisiert den Wert von `diceThrow` auf eine zufällige Zahl zwischen 1 und 6.
5. Die `build` Methode erstellt das Design der Seite:
    - MaterialApp mit dem Titel 'Feed Me'.
    - Scaffold mit Hintergrundfarbe `0xffba2323` und AppBar in der Farbe `0xFFFFC300`.
    - Die AppBar enthält den Titel 'Feed Me' in der Farbe `0xffba2323` und fett gedruckt.
    - Im Body der Scaffold befindet sich ein SafeArea, der ein zentriertes Card-Widget enthält.
        - Die Card hat abgerundete Ecken und ist transparent (`Color(0x00)`).
        - Im Inneren der Card befindet sich eine Spalte mit folgenden Elementen:
            - Ein erweiterbares Padding-Widget, das ein ClipRRect-Widget mit abgerundeten Ecken enthält, das ein Bild aus den Assets lädt, basierend auf dem Wert von `diceThrow`.
            - Ein SizedBox für Abstand.
            - Ein TextButton mit dem Text 'Starte Suche' in der Farbe `0xFFFFC300`, größerer Schriftgröße, breiterem Buchstabenabstand, fetter Schrift und der Schriftart 'Roboto_Slab'. Bei einem Klick auf den Button wird die `updateDice()` Funktion aufgerufen.
            - Ein weiterer SizedBox für Abstand am Ende der Card.