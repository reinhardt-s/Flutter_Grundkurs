# Flutter-Code Dokumentation - My Card App

![My Card App](../my_card.png)

Dieser Flutter-Code erstellt eine einfache Visitenkarten-App, die Informationen wie Avatar, Name, Job, Telefonnummer und E-Mail-Adresse anzeigt.

## Hauptkomponenten

1. `BCPage`: Eine `StatelessWidget`-Klasse, die die Hauptseite der Visitenkarten-App darstellt.
2. `CircleAvatar`: Zeigt den Avatar des Benutzers.
3. `Text`: Zeigt den Namen und den Job des Benutzers an.
4. `SizedBox`: Eine Trennlinie zwischen dem Jobtitel und den Kontaktinformationen.
5. `Card`: Container für die Telefonnummer und die E-Mail-Adresse.

## Struktur

- Die `BCPage`-Klasse ist ein StatelessWidget und baut die Hauptseite der Visitenkarten-App.
- `MaterialApp` und `Scaffold` bilden die Grundstruktur der App.
- Der Hintergrund der App ist `Colors.blueGrey`.
- Der Hauptinhalt der App ist in einer `SafeArea` eingeschlossen, um auf verschiedenen Geräten korrekt angezeigt zu werden.
- Ein `Column`-Widget wird verwendet, um alle Elemente der Visitenkarte vertikal anzuordnen.
- `CircleAvatar` zeigt das Benutzer-Avatar-Bild.
- Zwei `Text`-Widgets zeigen den Namen und den Job des Benutzers an.
- Eine `SizedBox` mit einem `Divider`-Widget erstellt eine Trennlinie.
- Zwei `Card`-Widgets werden verwendet, um die Telefonnummer und die E-Mail-Adresse darzustellen, jeweils mit einem passenden Icon (`Icons.phone` und `Icons.alternate_email`).

## Styling

- Name: Schriftart 'Pacifico', Größe 40.0, Farbe weiß und fett.
- Job: Schriftart 'Varela', Größe 20.0, Farbe `Colors.blueGrey.shade100`, fett und 2.5 Buchstabenabstand.
- Telefonnummer und E-Mail-Adresse: Schriftart 'Varela', Größe 19.0, Farbe `Colors.blueGrey.shade900`.


## Verwendete Material-Widgets und Dokumentation

In der folgenden Tabelle finden Sie die Material-Widgets, die in der My Card App verwendet werden, sowie Links zur offiziellen Dokumentation:

| Material-Widget       | Dokumentation                                              |
|-----------------------|------------------------------------------------------------|
| MaterialApp            | [MaterialApp Docs](https://api.flutter.dev/flutter/material/MaterialApp-class.html) |
| Scaffold              | [Scaffold Docs](https://api.flutter.dev/flutter/material/Scaffold-class.html) |
| SafeArea              | [SafeArea Docs](https://api.flutter.dev/flutter/widgets/SafeArea-class.html) |
| Column                | [Column Docs](https://api.flutter.dev/flutter/widgets/Column-class.html) |
| CircleAvatar          | [CircleAvatar Docs](https://api.flutter.dev/flutter/material/CircleAvatar-class.html) |
| AssetImage            | [AssetImage Docs](https://api.flutter.dev/flutter/painting/AssetImage-class.html) |
| Text                  | [Text Docs](https://api.flutter.dev/flutter/widgets/Text-class.html) |
| SizedBox              | [SizedBox Docs](https://api.flutter.dev/flutter/widgets/SizedBox-class.html) |
| Divider               | [Divider Docs](https://api.flutter.dev/flutter/material/Divider-class.html) |
| Card                  | [Card Docs](https://api.flutter.dev/flutter/material/Card-class.html) |
| EdgeInsets            | [EdgeInsets Docs](https://api.flutter.dev/flutter/painting/EdgeInsets-class.html) |
| ListTile              | [ListTile Docs](https://api.flutter.dev/flutter/material/ListTile-class.html) |
| Icon                  | [Icon Docs](https://api.flutter.dev/flutter/widgets/Icon-class.html) |

Diese Tabelle bietet einen schnellen Überblick über die verwendeten Material-Widgets und die zugehörigen Dokumentationslinks. Die Links führen zur offiziellen Flutter-Dokumentation, in der Sie weitere Informationen und Beispiele finden.
