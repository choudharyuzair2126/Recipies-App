import 'package:flutter/material.dart';
import 'package:recipie_app/Screens/home.dart';
<<<<<<< HEAD
=======
//import 'package:shared_preferences/shared_preferences.dart';
>>>>>>> 47f5d9b66d82ee258fbdfdb12915a50dce50426c

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
=======
>>>>>>> 47f5d9b66d82ee258fbdfdb12915a50dce50426c
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
