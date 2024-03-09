import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Colors.blueAccent;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      // textTheme: GoogleFonts.antonTextTheme(),
      listTileTheme: const ListTileThemeData(iconColor: seedColor),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle:
              const MaterialStatePropertyAll(TextStyle(color: Colors.black)),
          fixedSize: const MaterialStatePropertyAll(Size(150, 60)),
          backgroundColor: MaterialStatePropertyAll(Colors.yellow.shade600),
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        
        titleTextStyle: TextStyle(
          color: Colors.yellow.shade600,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          shadows: [
            Shadow(
              blurRadius: 2,
              color: Colors.red.shade900, // Color de la sombra
              offset: const Offset(3, 5), // Desplazamiento de la sombra
            ),
          ],
        ),
      ),
    );
  }
}
