import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: splash(),
    );
  }
}
Widget splash(){
  return SplashScreen(
    seconds: 5,
    photoSize: 150.0,
    image: Image.asset(
      'assets/images/agentword.png',
    ),
    title: Text('AGENT WORD',
      style: GoogleFonts.poppins(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
          fontSize: 24.0
      ),
    ),
    navigateAfterSeconds: const MyHomePage(title: 'Agent Word'),
  );
}