import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFonts {
  static TextStyle get font22white => GoogleFonts.fredoka(
      color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.w500);
  static TextStyle get font16whitefaded => GoogleFonts.fredoka(
      color: Colors.white.withOpacity(0.6), fontSize: 16.sp);
  static TextStyle get font18white =>
      GoogleFonts.fredoka(color: const Color.fromARGB(255, 237, 121, 252), fontSize: 18.sp);
       static TextStyle get font16greyfaded => GoogleFonts.fredoka(
      color: Colors.grey.withOpacity(0.6), fontSize: 16.sp, fontWeight: FontWeight.w500);
}
