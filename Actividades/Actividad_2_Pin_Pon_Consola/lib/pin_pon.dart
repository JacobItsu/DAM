// ---------------------------------------------------------------------------
// LIBRERÍA PRINCIPAL DEL PAQUETE `pin_pon`
// ---------------------------------------------------------------------------
// Este archivo actúa como "punto de entrada" de la librería: reexporta todas
// las piezas del juego para que puedan importarse con una sola línea:
//
//   import 'package:pin_pon/pin_pon.dart';
// ---------------------------------------------------------------------------

// Reexportamos los módulos que componen el juego.
export 'entities.dart'; // Pelota, Paleta y Marcador.
export 'game_config.dart'; // Constantes, GameMode y Dificultad.
export 'input.dart'; // Lectura de teclado.
export 'menu.dart'; // Menús previos a la partida.
export 'render.dart'; // Dibujado del tablero.

/// Mensaje de bienvenida que se muestra al arrancar el juego.
String saludo() {
  return 'Hola, este es un juego básico de ping pong en Dart, realizado como '
      'ejemplo para los estudiantes de programación del ITSU!\n';
}
