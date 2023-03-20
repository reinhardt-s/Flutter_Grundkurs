import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Hier ist die Wurzel der Anwendung.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hier wird der Titel der Anwendung angegeben.
      title: 'My Pastries',
      // Hier wird das Design der Anwendung angegeben.
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // Hier wird die Startseite der Anwendung angegeben.
      // title wird an die MainPage weitergegeben.
      home: const MainPage(title: 'Gebäck kaufen'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Hier wird der Zähler initialisiert.
  int _counter = 0;

  // Hier wird der Zähler um eins erhöht.
  void _incrementCounter() {
    // setState ruft die Methode build() erneut auf.
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Wird jedes Mal aufgerufen, wenn setState() aufgerufen wird.

    // Scaffold ist ein Layout-Widget. Es beinhaltet eine Appbar und einen Body.
    return Scaffold(
      appBar: AppBar(
        // Hier wird der Titel der Anwendung angegeben.
        title: Text(widget.title),
      ),
      // Hier wird der Inhalt der Anwendung angegeben.
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(children: [
          Image.asset('assets/images/pastry_bg.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover),
          // Zentriert den Container.
          Center(
            // Container ist ein Layout-Widget. Es nimmt ein einzelnes Kind-Element auf.
            child: Container(
              // Hier wird das Design des Containers angegeben.
              decoration: BoxDecoration(
                // Hier wird die Ecken des Containers abgerundet.
                borderRadius: BorderRadius.circular(10),
                // Hier wird die Farbe des Containers angegeben.
                color: Colors.black.withOpacity(0.5),
              ),
              // Hier wird der Inhalt des Containers angegeben.
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // Hier wird die Position der Kinder-Elemente angegeben.
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Text ist ein Layout-Widget.
                    const Text(
                      'Gebäcke gekauft:',
                      // Hier wird das Design des Textes angegeben.
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      // Hier wird der Zähler angegeben.
                      '$_counter',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    // Eigner Button mit Design
                    RawMaterialButton(onPressed: _incrementCounter,
                      fillColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.all(10),
                      constraints: BoxConstraints( minHeight: 50),
                      child: Text('Gebäck hinzufügen', style: TextStyle(color: Colors.white, fontSize: 20),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      // Hier wird der Button angegeben.
      // floatingActionButton: FloatingActionButton(
      //   // Hier wird die Methode aufgerufen, die den Zähler um eins erhöht.
      //   onPressed: _incrementCounter,
      //   // Hier wird das Icon angegeben.
      //   child: const Icon(Icons.add),
      // ), // Dieses Komma ist optional. Es hilft bei der Formatierung.
    );
  }
}