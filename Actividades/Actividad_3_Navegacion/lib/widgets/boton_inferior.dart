// ---------------------------------------------------------------------------
// WIDGET REUTILIZABLE: BOTÓN INFERIOR
// ---------------------------------------------------------------------------
// Encapsula el botón que aparece pegado a la parte inferior de ambas pantallas.
// Reutilizarlo evita duplicar estilos y mantiene las pantallas más limpias.
// ---------------------------------------------------------------------------

import 'package:flutter/material.dart';

/// Botón grande que se coloca en la zona inferior de la pantalla.
///
/// Recibe un [texto], un [icono] y la [accion] que se ejecuta al pulsarlo.
class BotonInferior extends StatelessWidget {
  /// Texto que muestra el botón.
  final String texto;

  /// Icono decorativo que acompaña al texto.
  final IconData icono;

  /// Callback que se ejecuta cuando el usuario pulsa el botón.
  final VoidCallback accion;

  const BotonInferior({
    super.key,
    required this.texto,
    required this.icono,
    required this.accion,
  });

  @override
  Widget build(BuildContext context) {
    // SafeArea evita que el botón quede tapado por la barra de navegación
    // del sistema en algunos teléfonos.
    return SafeArea(
      // Padding interior para que el botón no toque los bordes.
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity, // El botón ocupa todo el ancho disponible.
          height: 56,
          child: FilledButton.icon(
            onPressed: accion,
            icon: Icon(icono),
            label: Text(
              texto,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
