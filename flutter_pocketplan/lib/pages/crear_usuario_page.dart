import 'package:flutter/material.dart';

class CrearUsuarioScreen extends StatelessWidget {
  const CrearUsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fila 1 - Imagen (20%)
        Expanded(
          flex: 20,
          child: Container(
            color: Colors.yellow[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Crear nuevo usuario',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.person_add, size: 60),
              ],
            ),
          ),
        ),
        // Fila 2 - Correo electrónico
        Expanded(
          flex: 14,
          child: buildInputRow('Correo Electrónico:', Colors.blue[100]!),
        ),
        // Fila 3 - Nombre de usuario
        Expanded(
          flex: 14,
          child: buildInputRow('Nombre de Usuario:', Colors.pink[100]!),
        ),
        // Fila 4 - Contraseña
        Expanded(
          flex: 14,
          child: buildInputRow('Contraseña:', Colors.green[100]!),
        ),
        // Fila 5 - Confirmar Contraseña
        Expanded(
          flex: 14,
          child: buildInputRow('Confirmar Contraseña:', Colors.cyan[100]!),
        ),
        // Fila 6 - Botón principal
        Expanded(
          flex: 14,
          child: Container(
            color: Colors.orange[100],
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Crear Usuario'),
              ),
            ),
          ),
        ),
        // Fila 7 - Botón texto
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.blueGrey[100],
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Ir a Inicio de Sesión',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildInputRow(String label, Color color) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(label),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 6,
            child: const TextField(),
          ),
        ],
      ),
    );
  }
}
