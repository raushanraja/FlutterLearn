import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

final theme = ThemeData.dark().copyWith(
  accentColor: myOrange,
  appBarTheme: AppBarTheme(
    textTheme: GoogleFonts.montserratTextTheme(
        TextTheme(body1: TextStyle(color: Colors.white))),
  ),
  textTheme: GoogleFonts.montserratTextTheme(),
);
