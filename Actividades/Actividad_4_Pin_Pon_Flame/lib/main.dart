// ---------------------------------------------------------------------------
// ACTIVIDAD 4 - PING PONG CON FLUTTER + FLAME
// ---------------------------------------------------------------------------
// Migración del juego de consola (Actividad 2) a Flutter usando Flame.
// Reutiliza las entidades (Pelota, Paleta, Marcador) para mantener la lógica.
// ---------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'screens/menu_screen.dart';

void main() {
  runApp(const MiApp());
}

/// Widget raíz de la aplicación.
class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actividad 4 - Ping Pong Flame',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const MenuScreen(),
    );
  }
}
