// ---------------------------------------------------------------------------
// PANTALLA 2: SECUNDARIA
// ---------------------------------------------------------------------------
// Segunda pantalla de la aplicación. Muestra otro mensaje y, en la parte
// inferior, un botón que vuelve a la pantalla anterior.
// ---------------------------------------------------------------------------

import 'package:flutter/material.dart';

import '../widgets/boton_inferior.dart';

/// Segunda pantalla.
class PantallaSecundaria extends StatelessWidget {
  const PantallaSecundaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior. Gracias a `automaticallyImplyLeading: true` aparece
      // el botón para volver a la pantalla anterior.
      appBar: AppBar(
        title: const Text('Pantalla 2'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // El botón "atrás" se muestra automáticamente si Navigator puede
        // desapilar. Al llegar con 'push', sí puede.
      ),

      // Igual que la anterior: mensaje centrado + botón abajo.
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.celebration,
                      size: 96,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      '¡Estás en la segunda pantalla!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'El botón inferior te devuelve a la primera.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Botón inferior para volver.
          BotonInferior(
            texto: 'Volver a la primera pantalla',
            icono: Icons.arrow_back,
            accion: () => _volverAlInicio(context),
          ),
        ],
      ),
    );
  }

  /// Vuelve a la pantalla anterior desapilando esta pantalla del Navigator.
  void _volverAlInicio(BuildContext context) {
    Navigator.pop(context);
  }
}
