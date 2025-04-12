import 'package:flutter/material.dart';
import 'package:flutter_pocketplan/pages/recover_pasword.dart';

// Paleta de colores personalizada
class AppColors {
  static const Color fondo = Color(0xFF83b0c2);
  static const Color boton = Color(0xFFa4c3d3);
  static const Color textoClaro = Colors.white;
}

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key});

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      resizeToAvoidBottomInset: false, // <-- evita que se mueva el diseño
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Iniciar Sesión en Pocket Plan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: 35,
              child: Center(
                child: Icon(Icons.person, size: 350, color: Colors.black),
              ),
            ),
            // Fila 2: Usuario
            Expanded(
              flex: 15,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        'USUARIO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Center(
                      child: SizedBox(
                        width: 250,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20, // <-- tamaño de letra aumentado
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fila 3: Contraseña
            Expanded(
              flex: 15,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        'CONTRASEÑA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Center(
                      child: SizedBox(
                        width: 250,
                        child: TextField(
                          obscureText: _obscureText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20, // <-- tamaño de letra aumentado
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 20,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    backgroundColor: const Color.fromARGB(255, 167, 206, 226),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: Colors.black), // color corregido
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 22,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.person_add, color: Colors.black),
                        label: const Text(
                          'CREAR USUARIO',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RecoverPasswordPage(),
                            ),
                          );
                        },
                        backgroundColor: const Color.fromARGB(
                          255,
                          132,
                          205,
                          241,
                        ),
                        icon: const Icon(
                          Icons.lock_reset,
                          color: Colors.black,
                        ), // blanco
                        label: const Text(
                          'Olvidó su Contraseña',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // blanco
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
