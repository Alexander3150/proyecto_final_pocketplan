import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pocketplan/pages/code_validation_page.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  String? _emailError;
  bool _showUsernameError = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmailInRealTime);
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmailInRealTime);
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  void _validateEmailInRealTime() {
    if (_emailController.text.isEmpty) {
      setState(() => _emailError = null);
      return;
    }

    if (!_isValidEmail(_emailController.text)) {
      setState(() => _emailError = 'Ingrese un correo válido');
    } else {
      setState(() => _emailError = null);
    }
  }

  void _validateFields() {
    setState(() {
      // Validar email
      if (_emailController.text.isEmpty) {
        _emailError = 'Por favor ingrese su correo electrónico';
      } else if (!_isValidEmail(_emailController.text)) {
        _emailError = 'Ingrese un correo electrónico válido';
      }

      // Validar nombre de usuario
      _showUsernameError = _usernameController.text.isEmpty;
    });

    if (_emailError == null && !_showUsernameError) {
      // Ambos campos están válidos, proceder con el envío
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Código enviado correctamente'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Navegar a la pantalla de validación de código después de un breve retraso
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CodeValidationPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color primaryColor = const Color.fromARGB(255, 111, 171, 197);
    final Color accentColor = const Color.fromARGB(255, 124, 190, 216);
    final Color backgroundColor = const Color.fromARGB(255, 20, 55, 85);
    final Color errorColor = const Color(0xFFE57373);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperación de Contraseña'),
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
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Icono con efecto sutil
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
                    child: Icon(Icons.lock_reset, color: accentColor, size: 90),
                  ),

                  // Campos de texto
                  Column(
                    children: [
                      _buildEmailField(
                        controller: _emailController,
                        primaryColor: primaryColor,
                        accentColor: accentColor,
                        errorText: _emailError,
                        errorColor: errorColor,
                      ),

                      SizedBox(height: size.height * 0.025),

                      _buildUsernameField(
                        controller: _usernameController,
                        primaryColor: primaryColor,
                        accentColor: accentColor,
                        showError: _showUsernameError,
                        errorColor: errorColor,
                      ),

                      SizedBox(height: size.height * 0.04),

                      _buildLoginButton(accentColor: accentColor),
                    ],
                  ),

                  // Enlace de regreso
                  TextButton(
                    onPressed: () {},
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField({
    required TextEditingController controller,
    required Color primaryColor,
    required Color accentColor,
    required String? errorText,
    required Color errorColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Correo Electrónico',
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
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
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
              hintText: 'ejemplo@pocketplan.com',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            ),
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

  Widget _buildUsernameField({
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
          'Nombre de Usuario',
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
            style: const TextStyle(color: Colors.white),
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
            ),
          ),
        ),
        if (showError)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Por favor complete este campo',
              style: TextStyle(color: errorColor, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _buildLoginButton({required Color accentColor}) {
    return Center(
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
          ),
          onPressed: _validateFields,
          child: const Text(
            'Enviar código',
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
