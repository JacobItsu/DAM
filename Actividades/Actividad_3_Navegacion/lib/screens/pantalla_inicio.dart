// ---------------------------------------------------------------------------
// PANTALLA 1: INICIO
// ---------------------------------------------------------------------------
// Primera pantalla de la aplicación. Muestra un mensaje de bienvenida y, en
// la parte inferior, un botón que navega hacia la segunda pantalla.
// ---------------------------------------------------------------------------

import 'package:flutter/material.dart';

import '../widgets/boton_inferior.dart';
import 'pantalla_secundaria.dart';

/// Primera pantalla (contenido mostrado por defecto).
class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior.
      appBar: AppBar(
        title: const Text('Pantalla 1'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      // Column organiza el contenido: el mensaje crece y el botón queda abajo.
      body: Column(
        children: [
          // 'Expanded' hace que el mensaje ocupe todo el espacio sobrante,
          // empujando el botón hacia la parte inferior.
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icono grande representativo.
                    Icon(
                      Icons.waving_hand,
                      size: 96,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 24),

                    // Mensaje principal de la pantalla.
                    const Text(
                      '¡Bienvenido!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Esta es la primera pantalla.\n'
                      'Pulsa el botón de abajo para ir a la siguiente.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Botón inferior con la acción de navegar.
          BotonInferior(
            texto: 'Ir a la segunda pantalla',
            icono: Icons.arrow_forward,
            accion: () => _irASegundaPantalla(context),
          ),
        ],
      ),
    );
  }

  /// Navega a la [PantallaSecundaria] usando el [Navigator].
  ///
  /// `Navigator.push` apila una nueva pantalla encima de la actual, por lo que
  /// el botón "atrás" del sistema (y de la AppBar) permite volver.
  /// `MaterialPageRoute` proporciona la animación de transición de Material.
  void _irASegundaPantalla(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PantallaSecundaria()),
    );
  }
}
