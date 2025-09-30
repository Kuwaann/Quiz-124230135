import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuis_praktikum_mobile/screens/animalListPage.dart';
import 'package:kuis_praktikum_mobile/screens/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KnowYourAnimals',
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 0, 36))
      ),
      routes: {
        '/': (context) => const AnimalListPage(),
        '/login': (context) => const LoginPage(),
      },
      initialRoute: '/login',
    );
  }
}
