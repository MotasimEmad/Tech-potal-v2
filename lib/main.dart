import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacher/screen/annonuncements_screen.dart';
import 'package:teacher/screen/auth/login_screen.dart';
import 'package:teacher/screen/auth/edit_profile_screen.dart';
import 'package:teacher/screen/exams/course_exams_history_fragment.dart';
import 'package:teacher/screen/exams/exams_screen.dart';
import 'package:teacher/screen/home_screen.dart';
import 'package:teacher/screen/lecturer_screen.dart';
import 'package:teacher/screen/library/library_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blueGrey,
      ),
      home: LoginScreen(),
    );
  }
}
