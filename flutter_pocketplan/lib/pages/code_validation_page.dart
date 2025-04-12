import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pocketplan/pages/new_password_page.dart';

class CodeValidationPage extends StatefulWidget {
  const CodeValidationPage({super.key});

  @override
  State<CodeValidationPage> createState() => _CodeValidationPageState();
}

class _CodeValidationPageState extends State<CodeValidationPage> {
  final _codeController = TextEditingController();
  bool _showError = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _validateCode() {
    setState(() {
      _showError = _codeController.text.isEmpty;
    });

    if (!_showError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Código validado correctamente'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      // Navegar a la pantalla de validación de código después de un breve retraso
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NuevaContrasenaPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final Color primaryColor = const Color.fromARGB(255, 111, 171, 197);
    final Color accentColor = const Color.fromARGB(255, 124, 190, 216);
    final Color backgroundColor = const Color.fromARGB(255, 20, 55, 85);
    final Color errorColor = const Color(0xFFE57373);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Validación de Código'),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: backgroundColor,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono
                Container(
                  padding: const EdgeInsets.all(20),
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
                  child: Icon(Icons.lock_outline, color: accentColor, size: 90),
                ),
                const SizedBox(height: 24),

                // Campo de código
                _buildCodeField(
                  controller: _codeController,
                  primaryColor: primaryColor,
                  accentColor: accentColor,
                  showError: _showError,
                  errorColor: errorColor,
                ),
                const SizedBox(height: 32),

                // Botón
                _buildValidationButton(accentColor: accentColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeField({
    required TextEditingController controller,
    required Color primaryColor,
    required Color accentColor,
    required bool showError,
    required Color errorColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingrese el código de verificación',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color:
                    showError
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
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
            style: const TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor.withOpacity(0.5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: showError ? errorColor : accentColor,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: showError ? errorColor : accentColor,
                  width: 2,
                ),
              ),
              hintText: 'Solo ingrese números',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 18,
              ),
            ),
          ),
        ),
        if (showError)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Por favor ingrese el código recibido',
              style: TextStyle(color: errorColor, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _buildValidationButton({required Color accentColor}) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [accentColor, const Color(0xFF6D9DB1)],
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
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
          ),
          onPressed: _validateCode,
          child: const Text(
            'Validar Código',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
