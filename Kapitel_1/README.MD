# Kapitel 1 - Einführung in Flutter / Erste Designs

## Was wir lernen werden
  * Installation
    * https://docs.flutter.dev/get-started/install/windows
    * Android Studio
       * Plugins
       * Erstellen eines Emulators
       * Verbinden mit einem pysischen Mobil-Gerät
    * Flutter
    * Umgebungsvariablen
  * Erste App erstellen: MyPastries
    * Startet in main.dart, in der Funktion main()
    * Kommentare `// Kommentar` oder `/* Mehrzeiliger Kommentar */`
    * MaterialApp => https://material.io
    * Layout Elemente
    * Eigene Widgets erstellen
    * Context Actions
    * Image Assets
    * Android-App-Icon
  * Erstellen der zweiten App: MyCard
    * Hot Reload
    * Stateless Widget => https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
    * Stateful Widget => https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html

    ## Was ist Flutter?
    * Flutter ist ein Framework für die Entwicklung von Apps für Android und iOS
    * Flutter ist Open Source
    * Flutter passt sich an den Screensize an
    * Liefert Design- und Layout-Widgets: https://docs.flutter.dev/development/ui/widgets/material
    * Zeichnet auf Canvas
    * Hot Reload - Änderungen werden sofort angezeigt
    * Hot Restart - Neustart der App

    ## Design
    * Material-Widgets
    * Material-Icons
    * Styling von Widgets
    * Eigene Fonts
    * Eigene Bilder




## Was wir programmieren werden

| MyPastries - Eine einfache App mit einem Hintergrundbild | MyCard - Eine App mit einem Profilbild und Text  |
|---------------------------------------------------------|---------------------------------------------------------|
|![](my_pastries.png)  | ![](my_card.png)  |




-----

## Erste App - Ausgangslage
<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Text('Hello World!')));
```

</details>

### Erste App Step 1

<details>
  <summary>Code</summary>
  
```dart
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Center(child: Text('Hello World!'),),),),;
```

</details>

### Erste App - Step 1.1
Durch Komma am Ende der Zeile wird ein Zeilenumbruch und Einrückung erzwungen

<details>
  <summary>Code</summary>
    
```dart
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
```

</details>



### Erste App - Step 1.2
Die Fat Arrow Syntax ist nur für eine Zeile Code. Sie wird durch geschweifte Klammern ersetzt, wenn mehrere Zeilen Code verwendet werden.
Kommentare werden mit `//` eingeleitet. Mehrzeilige Kommentare werden mit `/*` und `*/` eingeleitet.

<details>
  <summary>Code</summary>
  
```dart
import 'package:flutter/material.dart';

// Diese Funktion wird beim Start der App aufgerufen
void main() {
  runApp(
    MaterialApp(
      home: Center(
        /*
        Center ist ein Layout Widget, welches ein Kind zentriert.
        In diesem Fall ist das Kind ein Text Widget.
        */
        child: Text('Hello World!'),
      ),
    ),
  );
}
```

</details>

### Erste App - Step 2
Scaffold https://api.flutter.dev/flutter/material/Scaffold-class.html  
AppBar https://api.flutter.dev/flutter/material/AppBar-class.html  
Image https://api.flutter.dev/flutter/widgets/Image-class.html 

Wir lernen die Widgets Scaffold, AppBar und Image kennen.
Scaffold ist das Grundgerüst einer App. Es enthält die AppBar und den Body.
Die AppBar ist die Titelleiste einer App. Sie enthält den Titel und die Icons.
Image ist ein Widget, welches ein Bild darstellt.

<details>
  <summary>Code</summary>
  
```dart
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
          child: Image.asset('assets/images/pastry_bg.png'),
        ),
      ),
    ),
  );
}
```	

</details>

### Erste App - Step 2.1
Wir passen die Größe des Bildes so an, dass es die gesamte Fläche ausfüllt.
fit => https://api.flutter.dev/flutter/painting/BoxFit-class.html

Folgende Optionen stehen zur Verfügung:
| Option               | Funktion                |
|----------------------|-------------------------|
| `fit: BoxFit.fill`   | Füllt den Container     |
| `fit: BoxFit.contain`| Behält das Seitenverhältnis bei und füllt den Container so weit wie möglich aus |
| `fit: BoxFit.fitWidth` | Skaliert das Bild, um die Breite des Containers auszufüllen, wobei das Seitenverhältnis erhalten bleibt |
| `fit: BoxFit.fitHeight`| Skaliert das Bild, um die Höhe des Containers auszufüllen, wobei das Seitenverhältnis erhalten bleibt |
| `fit: BoxFit.none`   | Keine Skalierung, zeigt das Bild in seiner ursprünglichen Größe an |
| `fit: BoxFit.scaleDown`| Skaliert das Bild so, dass es sowohl in Breite als auch in Höhe in den Container passt, ohne das Seitenverhältnis zu ändern |
| `fit: BoxFit.cover`    | Skaliert das Bild, um den gesamten Container auszufüllen, wobei das Seitenverhältnis erhalten bleibt und Teile des Bildes möglicherweise abgeschnitten werden |
<details>
  <summary>Code</summary>
  
```dart
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
            alignment: Alignment.center,
          ),
        ),
      ),
    ),
  );
}
```

</details>

-----

## Zweite App - Challenge 1:
Erstelle eine App, welche:
 * Ein Scaffold hat
 * Die Hintergrundfarbe `teal` hat
 * Einen `Container` als `body` hat  
Ändere die Hintegrundfarbe des Scaffolds auf `blueGrey`  

Conainer: https://api.flutter.dev/flutter/widgets/Container-class.html

### Zweite App - Step 1

<details>
  <summary>Code</summary>
  
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Container(),
      ),
    ),
  );
}
```

</details>

### Zweite App - Step 2
Hot Reload funktioniert nur bei Stateful Widgets oder Stateless Widgets

`stful` erzeugt ein Stateful-Widget
`stless` erzeugt ein Stateless-Widget

`StatefulWidget` und `StatelessWidget` sind zwei grundlegende Widget-Typen in Flutter, die sich im Umgang mit dem Zustand (state) der Anwendung unterscheiden.

`StatelessWidget`:

Ein `StatelessWidget` ist ein Widget, das seinen Zustand nicht während seiner Lebensdauer ändert. Es beschreibt einen Teil der Benutzeroberfläche, der sich allein aufgrund seiner Konfiguration darstellen kann. Da sich ein `StatelessWidget` nicht ändert, wird es jedes Mal neu gerendert, wenn es neu konfiguriert wird (z. B. wenn sich die übergeordneten Widgets ändern).

`StatefulWidget`:

Ein `StatefulWidget`, im Gegensatz zum `StatelessWidget`, kann seinen Zustand während seiner Lebensdauer ändern. Es besteht aus zwei Teilen: dem Widget selbst und dem zugehörigen State-Objekt. Wenn sich der Zustand ändert, wird das Widget neu aufgebaut und aktualisiert seine Darstellung.


<details>
  <summary>Code</summary>
  
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    // Ruft das Stateless Widget auf BCPage auf
    const BCPage(),
  );
}

// Erstellt ein Stateless Widget
class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  // Wird immer aufgerufen, wenn eine neue Version des Widgets gebaut werden soll
  // Wenn sich also etwas, wie die Farbe ändert, sucht Flutter nach der nächsten build Methode und ruft diese auf
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Business Card'),
        ),
        body: Container(
          color: Colors.brown,
        ),
      ),
    );
  }
```

</details>

### Zweite App - Step 3
| Widget/Eigenschaften                                                          | Funktionserklärung                                                                                          |
|----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| [`SafeArea`](https://api.flutter.dev/flutter/widgets/SafeArea-class.html) | Ein Widget, das seine Kinder innerhalb des sicheren Bereichs eines Bildschirms platziert, um Displayeinschnitte und Systemanzeigen zu vermeiden. |
| [`Margin`](https://api.flutter.dev/flutter/widgets/Container-class.html)  | Ein Randabstand, der durch das `margin`-Attribut des `Container`-Widgets festgelegt wird und den Abstand zwischen dem Widget und seinen benachbarten Widgets definiert. |
| [`Padding`](https://api.flutter.dev/flutter/widgets/Padding-class.html)   | Ein Widget, das innere Abstände für seine Kinder erzeugt, um Platz zwischen dem Widget-Rand und seinem Inhalt zu schaffen.                                        |
| [`Text`](https://api.flutter.dev/flutter/widgets/Text-class.html)        | Ein Ein Widget, das stilisierten Text anzeigt und dabei verschiedene Textstile, Schriftarten und Ausrichtungen unterstützt.                                                                                |


`width` / `height`: Breite und Höhe des Containers

<details>
  <summary>Code</summary>
    
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
          title: Text('My Business Card'),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            padding: EdgeInsets.all(20.0),
            width: 100,
            height: 100,
            color: Colors.brown,
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
```

</details>

### Zweite App - Step 4
| Widget                                                          | Funktionserklärung                                                                                          |
|----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| [`Row`](https://api.flutter.dev/flutter/widgets/Row-class.html)      | Ein Widget, das seine Kinder horizontal in einer einzigen Zeile anordnet und dabei die verfügbare Breite ausfüllt.                                                    |
| [`Column`](https://api.flutter.dev/flutter/widgets/Column-class.html)  | Ein Widget, das seine Kinder vertikal in einer einzigen Spalte anordnet und dabei die verfügbare Höhe ausfüllt.                                                      |



| Attribut                                                                                                 | Funktionserklärung                                                                                                         |
|----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| [`mainAxisAlignment: MainAxisAlignment.center`](https://api.flutter.dev/flutter/rendering/MainAxisAlignment-class.html)       | Zentriert die Kinder entlang der Hauptachse (horizontal für `Row` und vertikal für `Column`).                              |
| [`mainAxisSize: MainAxisSize.min`](https://api.flutter.dev/flutter/rendering/MainAxisSize-class.html)                      | Reduziert die Größe der Hauptachse auf die minimale Größe, die notwendig ist, um alle Kinder zu umfassen.                  |
| [`verticalDirection: VerticalDirection.up`](https://api.flutter.dev/flutter/rendering/VerticalDirection-class.html)         | Ordnet die Kinder entlang der vertikalen Achse in umgekehrter Reihenfolge an, sodass sie von unten nach oben angeordnet sind. |
 

### Zweite App - Step 5
`Container` in `Column` am Ende beginnen lassen
Durch hinzufügen eines Containers mit maximaler Breite
`double.infinity` https://api.flutter.dev/flutter/dart-core/double/infinity-constant.html  
`crossAxisAlignment: CrossAxisAlignment.stretch` Zieht die Kinder Elemente auf die maximale Breite des Containers  
`SizedBox` https://api.flutter.dev/flutter/widgets/SizedBox-class.html
Kann genutzt werden um Platz zwischen Elementen zu schaffen

```dart	
SizedBox(
  height: 20.0,
),
```

<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
          title: Text('My Business Card'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.brown,
              child: Text('Container_1'),
            ),
            Container(
              width: 300,
              height: 100,
              color: Colors.brown[900],
              child: Text('Container_2'),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.teal[900],
              child: Text('Container_3'),
            ),
            Container(
              // width: double.infinity,
              height: 10,
              color: Colors.white,
              child: Text('Container_3'),
            ),
          ],
        ),
      ),
    );
  }
}

```

</details>

### Zweite App - Challenge 2:
Füge zwischen den Containern eine `SizedBox` mit einer Höhe von 20.0 hinzu

<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
          title: Text('My Business Card'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // width: 100,
              height: 100,
              color: Colors.brown,
              child: Text('Container_1'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // width: 300,
              height: 100,
              color: Colors.brown[900],
              child: Text('Container_2'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // width: 100,
              height: 100,
              color: Colors.teal[900],
              child: Text('Container_3'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // width: double.infinity,
              height: 10,
              color: Colors.white,
              child: Text('Container_3'),
            ),
          ],
        ),
      ),
    );
  }
}

```

</details>

### Zweite App - Step 6
`Row` https://api.flutter.dev/flutter/widgets/Row-class.html
Rows verhalten sich ähnlich wie Columns, nur horizontal.
Tausche `Column` gegen `Row` aus.
Die `SizedBoxes` sind nicht mehr sichtbar. Was könnte die Ursache sein?

<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
          title: Text('My Business Card'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // width: 100,
              height: 100,
              color: Colors.brown,
              child: Text('Container_1'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // width: 300,
              height: 100,
              color: Colors.brown[900],
              child: Text('Container_2'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // width: 100,
              height: 100,
              color: Colors.teal[900],
              child: Text('Container_3'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // width: double.infinity,
              height: 10,
              color: Colors.white,
              child: Text('Container_3'),
            ),
          ],
        ),
      ),
    );
  }
}
```

</details>


### Zweite App - Step 7: Umstyling
| Bezeichnung                                                              | Funktionserklärung                                                                                                        |
|-------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| [`CircleAvatar`](https://api.flutter.dev/flutter/material/CircleAvatar-class.html) | Ein kreisförmiges Avatar-Widget, das typischerweise ein Benutzerbild oder ein Initial darstellt.                        |
| [`TextStyle`](https://api.flutter.dev/flutter/painting/TextStyle-class.html)     | Eine Klasse, die verschiedene Textstile wie Farbe, Schriftart, Schriftgröße und Textschatten definiert und anwendet. |
| [`AssetImage`](https://api.flutter.dev/flutter/painting/AssetImage-class.html) | Ein Bildanbieter, der Bilder aus den Asset-Bundles lädt, normalerweise aus den in der `pubspec.yaml` definierten Assets. |

* Lösche alle Elemente innerhalb des `body` des `Scaffold` Widgets
* Erstelle eine neue Ordner-Struktur `assets\images` und füge entweder `avatar_1.png` oder `avatar_2.png` hinzu
* Ergänze in `pubspec.yaml` die `assets` Sektion
* Füge dem `Scaffold` eine `SafeArea` hinzu
* Füge der `SafeArea` eine `Column` hinzu
* Füge der `Column` eine `CircleAvatar` hinzu 
* Setzte die `radius` der `CircleAvatar` auf 50.0
* Setze `foregroundImage` des `CircleAvatar` auf `AssetImage('assets/images/avatar_1.png')` oder `AssetImage('assets/images/avatar_2.png')`
* Füge ein `Text` Widget mit deinem Namen hinzu . z.B. `Kim Smith`
* Passe den `TextStyle` wie folgt an:
  * `color: Colors.white`
  * `fontSize: 40.0`
  * `fontWeight: FontWeight.bold`


<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                  foregroundImage: AssetImage('assets/images/avatar_1.png'),
                  radius: 50.0),
              Text(
                'Kim Smith',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

</details>

### Zweite App - Step 8: Fonts
fonts.google.com - Frei zur kommerziellen Nutzung  
* Füge die ttf Datei in den Ordner `assets\fonts` hinzu
* Ergänze in `pubspec.yaml` die `fonts` Sektion:

```yaml
fonts:
  - family: Pacifico
    fonts:
      - asset: assets/fonts/Pacifico-Regular.ttf
```

* Füge im TextStyle die `fontFamily` hinzu
* Füge ein Text Widget mit deiner Berufsbezeichnung hinzu
* Lade eine passende Schriftart von fonts.google.com
  * z.B. Varela Round
  * Füge die ttf Datei in den Ordner `assets\fonts` hinzu
  * Ergänze in `pubspec.yaml` die `fonts` Sektion.
* Passe den TextStyle deiner Berufsbezeichnung wie folgt an:
  * `color: Colors.blueGrey.shade100`
  * `fontSize: 20.0`
  * `fontWeight: FontWeight.bold`
  * `letterSpacing: 2.5`
  * `fontFamily: Varela Round`

<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                  foregroundImage: AssetImage('assets/images/avatar_1.png'),
                  radius: 50.0),
              Text(
                'Kim Smith',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              Text(
                'KEY ACCOUNT MANAGER',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blueGrey.shade100,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Varela',
                    letterSpacing: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
</details>

### Zweite App - Step 9: Material Icons und Widgets

| Bezeichnung                                                           | Funktionserklärung                                                                                                     |
|----------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| [`Icon`](https://api.flutter.dev/flutter/widgets/Icon-class.html)     | Ein grafisches Symbol, das auf der Grundlage eines Glyphs aus einem Schriftsatz erstellt wird, um eine Bedeutung darzustellen. |
| [`Icons`](https://api.flutter.dev/flutter/material/Icons-class.html)  | Eine vordefinierte Sammlung von Material Design-Icons, die in Kombination mit dem `Icon`-Widget verwendet werden können.    |


* Füge nach dem Job-Titel einen `Container` hinzu.
* Der `Container` soll eine `Row` als `child` haben.
  * Die `Row` soll als `children` haben:
    * Ein `Icon` mit dem `Icons.phone` und `color: Colors.blueGrey.shade900`- (https://materialpalette.com)
    * Ein `SizedBox` mit `width: 10.0`.
    * Ein `Text` Widget mit der Telefonnummer.
    * Style den `Text` Widget wie folgt:
      * `color: Colors.blueGrey.shade900`
      * `fontSize: 20.0`
      * `fontFamily: Varela`
    * Ändere die Containerfarbe auf `Colors.white`.
    * Setzte das `margin` auf `10.0` im vertikalen und `25.0` im horizontalen Bereich.
    * Setzte das `padding` des Container-Widgets auf `10.0` rundherum.
    * Erstelle einen Zweiten Container mit den gleichen Eigenschaften wie der erste, welcher deine E-Mail Adresse enthält und das passende Icon verwendet.

<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
              // Unser Avatar
              CircleAvatar(
                  foregroundImage: AssetImage('assets/images/avatar_1.png'),
                  radius: 50.0),
              // Unser Name
              Text(
                'Alex Smith',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              // Unser Job
              Text(
                'KEY ACCOUNT MANAGER',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey.shade100,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varela',
                  letterSpacing: 2.5,
                ),
              ),
              // Container für unsere Telefonnummer
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.blueGrey.shade900),
                    SizedBox(width: 10.0),
                    Text(
                      '+49 151 4124 5221',
                      style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              // Container für unsere E-Mail
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.alternate_email, color: Colors.blueGrey.shade900),
                    SizedBox(width: 10.0),
                    Text(
                      'kim.smith@needful-apps.de',
                      style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontFamily: 'Varela',
                        fontSize: 16.5,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```

</details>


### Zweite App - Step 10: Divider und Card Widgets

| Bezeichnung                                                               | Funktionserklärung                                                                                                              |
|--------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| [`Card`](https://api.flutter.dev/flutter/material/Card-class.html)       | Ein Material Design-Karten-Widget, das verwendet wird, um verwandte Informationen in einer abgerundeten, erhöhten Box anzuzeigen. |


* Tausche die `Container` für die Telefonnummer und Email gegen ein `Card` Widget aus.
* Füge für den Inhalt der Card-Widgets ein `Padding` als parent hinzu.
* Setze das `padding` auf `EdgeInsets.all(20.0)`.


<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
              // Das Avatar
              CircleAvatar(
                  foregroundImage: AssetImage('assets/images/avatar_1.png'),
                  radius: 50.0),
              // Der Name
              Text(
                'Kim Smith',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              // Der Job
              Text(
                'KEY ACCOUNT MANAGER',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey.shade100,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varela',
                  letterSpacing: 2.5,
                ),
              ),
              // Container für die Telefonnummer
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.blueGrey.shade900),
                      SizedBox(width: 10.0),
                      Text(
                        '+49 151 4124 5221',
                        style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontFamily: 'Varela',
                            fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container für die E-Mail
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(Icons.alternate_email, color: Colors.blueGrey.shade900),
                      SizedBox(width: 10.0),
                      Text(
                        'kim.smith@needful-apps.de',
                        style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontFamily: 'Varela',
                          fontSize: 16.5,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

```

</details>

### Zweite App - Step 10.1: Divider und Card Widgets

| Bezeichnung                                                               | Funktionserklärung                                                                                                              |
|--------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| [`ListTile`](https://api.flutter.dev/flutter/material/ListTile-class.html)| Ein einzelnes, fest codiertes Element innerhalb einer Liste, das in der Regel aus einem Icon und einem Text besteht.             |
| [`Divider`](https://api.flutter.dev/flutter/material/Divider-class.html)  | Ein dünnes, horizontal oder vertikal ausgerichtetes Linien-Widget, das als Trennzeichen zwischen Elementen in einer Liste dient.  |


* Tausche die `Row` für die Telefonnummer und Email gegen ein `ListTile` Widget aus
* Entferne die `Padding` Widgets
* Zentriere den Inhalt der `Column`
* Füge eine `SizedBox` zwischen dem Job-Title und der Telefonnummer ein. Sie soll 20.0 Pixel hoch sein.
* Füge einen `Divider` in die `SizedBox` als Child ein. Der Divider soll die Farbe `Colors.blueGrey.shade900` haben.


<details>
  <summary>Code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const BCPage(),
  );
}

class BCPage extends StatelessWidget {
  const BCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Das Avatar
              CircleAvatar(
                  foregroundImage: AssetImage('assets/images/avatar_1.png'),
                  radius: 50.0),
              // Der Name
              Text(
                'Kim Smith',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              // Der Job
              Text(
                'KEY ACCOUNT MANAGER',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey.shade100,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Varela',
                  letterSpacing: 2.5,
                ),
              ),
              // Trennlinie
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.blueGrey.shade100,
                ),
              ),
              // Container für die Telefonnummer
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.blueGrey.shade900),
                  title: Text(
                    '+ 49 151 4124 5221',
                    style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontFamily: 'Varela',
                        fontSize: 19.0),
                  ),
                ),
              ),
              // Container für die E-Mail
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.alternate_email,
                      color: Colors.blueGrey.shade900),
                  title: Text(
                    'kim.smith@needful-apps.de',
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontFamily: 'Varela',
                      fontSize: 19,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```

</details>
