import 'package:flutter/material.dart';
import 'package:flutter_pocketplan/pages/IniciarSesion.dart';

class NuevaContrasenaPage extends StatefulWidget {
  @override
  _NuevaContrasenaPageState createState() => _NuevaContrasenaPageState();
}

class _NuevaContrasenaPageState extends State<NuevaContrasenaPage> {
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _confirmarContrasenaController =
      TextEditingController();

  bool _obscureContrasena = true;
  bool _obscureConfirmarContrasena = true;
  String? _errorTextoContrasena;
  String? _errorTextoConfirmarContrasena;

  final Color primaryColor = const Color.fromARGB(255, 111, 171, 197);
  final Color accentColor = const Color.fromARGB(255, 124, 190, 216);
  final Color backgroundColor = const Color.fromARGB(255, 20, 55, 85);
  final Color errorColor = const Color(0xFFE57373);

  void _validarCampos() {
    setState(() {
      _errorTextoContrasena =
          _contrasenaController.text.isEmpty
              ? 'Por favor, ingrese la contraseña'
              : null;
      _errorTextoConfirmarContrasena =
          _confirmarContrasenaController.text.isEmpty
              ? 'Por favor, confirme la contraseña'
              : (_contrasenaController.text !=
                      _confirmarContrasenaController.text
                  ? 'Las contraseñas no coinciden'
                  : null);
    });
  }

  void _guardarContrasena() {
    _validarCampos();

    if (_errorTextoContrasena == null &&
        _errorTextoConfirmarContrasena == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contraseña actualizada correctamente'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      // Navegar a la pantalla de validación de código después de un breve retraso
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const IniciarSesion()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Contraseña'),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: primaryColor),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40), // Espacio adicional arriba
                  // Icono con efecto sutil
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(Icons.lock_reset, color: accentColor, size: 90),
                  ),

                  _buildTextField(
                    controller: _contrasenaController,
                    label: 'Nueva contraseña',
                    obscureText: _obscureContrasena,
                    toggleVisibility: () {
                      setState(() {
                        _obscureContrasena = !_obscureContrasena;
                      });
                    },
                    errorText: _errorTextoContrasena,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _confirmarContrasenaController,
                    label: 'Confirmar contraseña',
                    obscureText: _obscureConfirmarContrasena,
                    toggleVisibility: () {
                      setState(() {
                        _obscureConfirmarContrasena =
                            !_obscureConfirmarContrasena;
                      });
                    },
                    errorText: _errorTextoConfirmarContrasena,
                  ),
                  const SizedBox(height: 30),

                  // Botón con gradiente
                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [accentColor, Color(0xFF6D9DB1)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                        ),
                        onPressed: _guardarContrasena,
                        child: const Text(
                          'Guardar contraseña',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 200,
                  ), // Espacio adicional antes del botón de regreso

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IniciarSesion(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      '¿Volver al Inicio de sesión?',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: accentColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20), // Espacio adicional abajo
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback toggleVisibility,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color:
                    errorText != null
                        ? errorColor.withOpacity(0.2)
                        : accentColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor.withOpacity(0.5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: errorText != null ? errorColor : accentColor,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: errorText != null ? errorColor : accentColor,
                  width: 2,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
                onPressed: toggleVisibility,
              ),
            ),
            onChanged: (_) => _validarCampos(),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              errorText,
              style: TextStyle(color: errorColor, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
