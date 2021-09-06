import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Taredas',
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.indigoAccent,

        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 0.5,
        ),

        textTheme: TextTheme(
          headline1: GoogleFonts.ubuntu(
            textStyle: TextStyle(color: Colors.black, fontSize: 38,fontWeight: FontWeight.bold)
          ),
          headline6: GoogleFonts.ubuntu(
            textStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300)
          )
        )
      ),

      home: HomeScreen(),
    );
  }
}
