import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

customAllertDialog(String title, String message, String type) {
  Get.dialog(
    AlertDialog(
        title: Text(title),
        titleTextStyle: GoogleFonts.poppins(
          color: type == "error" ? error : primary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        content: Text(
          message,
        ),
        contentTextStyle: GoogleFonts.poppins(
          color: hints,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: EdgeInsets.all(32),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side:
                BorderSide(color: Color.fromRGBO(189, 189, 189, 1), width: 2))),
  );
}
