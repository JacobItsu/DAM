// ---------------------------------------------------------------------------
// ACTIVIDAD 3 - NAVEGACIÓN ENTRE PANTALLAS CON FLUTTER
// ---------------------------------------------------------------------------
// Objetivo:
//   Crear una aplicación Flutter con DOS pantallas. En la primera se muestra
//   un mensaje; al pulsar un botón situado en la parte inferior se realiza una
//   transición animada hacia la segunda pantalla, que muestra otro mensaje.
//
// Cómo ejecutar (Android):
//   flutter run
//
// La navegación se hace con Navigator + MaterialPageRoute, que es la forma
// estándar de movernos entre pantallas en Flutter.
// ---------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'screens/pantalla_inicio.dart';

void main() {
  // Punto de entrada de toda app Flutter.
  runApp(const MiApp());
}

/// Widget raíz de la aplicación.
///
/// Configura el tema y define cuál es la primera pantalla que se muestra.
class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título usado por el sistema operativo (por ejemplo, en el selector
      // de apps recientes de Android).
      title: 'Actividad 3 - Navegación',

      // Quitamos la etiqueta de "debug" de la esquina superior derecha.
      debugShowCheckedModeBanner: false,

      // Tema visual de la aplicación.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),

      // La app arranca mostrando la pantalla de inicio.
      home: const PantallaInicio(),
    );
  }
}
