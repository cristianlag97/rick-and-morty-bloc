import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constans/constants.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        //* General */
        useMaterial3: true,
        colorSchemeSeed: colorPrimary,

        ///* Texts
        textTheme: TextTheme(
            titleLarge: GoogleFonts.montserratAlternates()
                .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            titleMedium: GoogleFonts.montserratAlternates()
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            titleSmall:
                GoogleFonts.montserratAlternates().copyWith(fontSize: 20),
            bodyMedium: GoogleFonts.montserratAlternates()),

        ///* Scaffold Background Color
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      );
}
