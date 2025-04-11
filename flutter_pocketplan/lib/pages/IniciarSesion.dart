import 'package:flutter/material.dart';
import 'package:flutter_pocketplan/pages/recover_pasword.dart';

// Paleta de colores personalizada (como en recover_password.dart)
class AppColors {
  static const Color fondo = Color(0xFF143755); // fondo oscuro azulado
  static const Color boton = Color(0xFF6FABC5); // botones azul celeste
  static const Color textoClaro = Colors.white;
  static const Color bordeInput = Color(0xFF7CBED8); // borde para los campos
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
      resizeToAvoidBottomInset: false,
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
                  color: AppColors.textoClaro,
                ),
              ),
            ),
            Expanded(
              flex: 35,
              child: Center(
                child: Icon(Icons.person, size: 350, color: AppColors.textoClaro),
              ),
            ),
            // Fila Usuario
            Expanded(
              flex: 15,
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        'USUARIO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.textoClaro,
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.textoClaro,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.boton,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.bordeInput),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.bordeInput),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.textoClaro, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fila Contraseña
            Expanded(
              flex: 15,
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        'CONTRASEÑA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.textoClaro,
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.textoClaro,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.boton,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.bordeInput),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.bordeInput),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.textoClaro, width: 2),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                                color: Colors.white70,
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
            // Botón Iniciar Sesión
            Expanded(
              flex: 20,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: AppColors.boton,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: AppColors.textoClaro),
                  ),
                ),
              ),
            ),
            // Botones Crear Usuario y Recuperar Contraseña
            Expanded(
              flex: 22,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: TextButton.icon(
                        onPressed: () {
                          // Por ahora sin acción
                        },
                        icon: const Icon(Icons.person_add, color: AppColors.textoClaro),
                        label: const Text(
                          'CREAR USUARIO',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textoClaro,
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
                        backgroundColor: AppColors.boton,
                        icon: const Icon(Icons.lock_reset, color: Colors.black),
                        label: const Text(
                          'Olvidó su Contraseña',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
