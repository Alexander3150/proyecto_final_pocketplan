import 'package:flutter/material.dart';
import 'pages/crear_usuario_page.dart';
import 'pages/IniciarSesion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Usuario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const IniciarSesion(),
        '/register': (context) => const CrearUsuarioScreen(),
      },
    );
  }
}
