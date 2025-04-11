import 'package:flutter/material.dart';

class CrearUsuarioScreen extends StatelessWidget {
  const CrearUsuarioScreen({super.key});

  final Color fondoOscuro = const Color(0xFF121212);
  final Color celeste = const Color(0xFF00BFFF); // DeepSkyBlue
  final Color grisClaro = const Color(0xFFBBBBBB);
  final Color fondoCajaTexto = const Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoOscuro,
      body: SafeArea(
        child: Column(
          children: [
            // Título
            Expanded(
              flex: 20,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Crear nuevo usuario',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Icon(Icons.person_add, size: 60, color: celeste),
                  ],
                ),
              ),
            ),
            // Campos de entrada
            Expanded(flex: 14, child: buildInputRow('Correo Electrónico:')),
            Expanded(flex: 14, child: buildInputRow('Nombre de Usuario:')),
            Expanded(flex: 14, child: buildInputRow('Contraseña:', obscure: true)),
            Expanded(flex: 14, child: buildInputRow('Confirmar Contraseña:', obscure: true)),
            // Botón principal
            Expanded(
              flex: 14,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: celeste,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Crear Usuario'),
                ),
              ),
            ),
            // Enlace
            Expanded(
              flex: 10,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Ir a Inicio de Sesión',
                  style: TextStyle(color: celeste),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputRow(String label, {bool obscure = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(color: Color(0xFFBBBBBB)), // gris claro
            ),
          ),
          Expanded(
            flex: 6,
            child: TextField(
              obscureText: obscure,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF1E1E1E), // gris oscuro
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF00BFFF)), // celeste
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF00BFFF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
