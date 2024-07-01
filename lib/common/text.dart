import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle AppStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.inter(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}
