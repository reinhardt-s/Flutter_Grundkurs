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
              // Unser Avatar
              CircleAvatar(
                  foregroundImage: AssetImage('assets/images/avatar_1.png'),
                  radius: 50.0),
              // Unser Name
              Text(
                'Kim Smith',
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
              // Trennlinie
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.blueGrey.shade100,
                ),
              ),
              // Container für unsere Telefonnummer
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
              // Container für unsere E-Mail
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
