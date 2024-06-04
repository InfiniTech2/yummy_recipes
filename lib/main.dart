import 'package:flutter/material.dart';
import 'src/views/app/screens/initial.dart';
import 'src/views/app/screens/auth/login.dart';
import 'src/views/app/screens/auth/cadastro.dart';
import 'src/views/app/screens/home.dart';
import 'src/views/app/screens/newRecipe.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Initial(),
        '/login': (contexto) => const Login(),
        '/cadastro': (context) => Cadastro(),
        '/home': (context) => const Home(),
        '/newRecipe': (context) => const NewRecipe()
      },
    ),
  );
}
