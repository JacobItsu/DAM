// ---------------------------------------------------------------------------
// RENDERIZADO EN CONSOLA
// ---------------------------------------------------------------------------
// Convierte el estado del juego (bola, paletas y puntajes) en caracteres de
// texto que se imprimen en la terminal.
// ---------------------------------------------------------------------------

import 'dart:io';
import 'entities.dart';
import 'game_config.dart';

/// Utilidad encargada de dibujar un fotograma completo del tablero.
class Renderer {
  /// Dibuja el marcador, los bordes, la red central, la bola y las paletas.
  ///
  /// Se usa un [StringBuffer] para construir todo el fotograma en memoria y
  /// escribirlo de una sola vez a `stdout`. Esto evita parpadeos (flicker)
  /// que ocurrirían si imprimiéramos línea por línea.
  static void dibujar(Pelota pelota, Paleta j1, Paleta j2, int p1, int p2) {
    final buffer = StringBuffer();

    // Mueve el cursor al origen (1,1) SIN borrar la pantalla.
    // Así sobrescribimos el fotograma anterior en el mismo sitio.
    buffer.write('\x1B[H');

    // ----- Marcador -----
    buffer.writeln('  Jugador 1: $p1  |  Jugador 2: $p2'.padRight(GameConfig.ancho));
    buffer.writeln('+${'-' * (GameConfig.ancho - 2)}+');

    // ----- Tablero -----
    for (int y = 0; y < GameConfig.alto; y++) {
      buffer.write('|'); // Borde izquierdo.

      // Recorremos el interior del tablero (sin los bordes laterales).
      for (int x = 1; x < GameConfig.ancho - 1; x++) {
        if (x == pelota.x && y == pelota.y) {
          buffer.write('O'); // Bola.
        } else if (x == j1.x && y >= j1.y && y < j1.y + j1.alto) {
          buffer.write(']'); // Paleta del jugador 1.
        } else if (x == j2.x && y >= j2.y && y < j2.y + j2.alto) {
          buffer.write('['); // Paleta del jugador 2.
        } else if (x == GameConfig.ancho ~/ 2) {
          buffer.write(':'); // Red central.
        } else {
          buffer.write(' '); // Celda vacía.
        }
      }

      buffer.writeln('|'); // Borde derecho.
    }

    // ----- Borde inferior -----
    buffer.writeln('+${'-' * (GameConfig.ancho - 2)}+');

    // Escribimos el fotograma completo de una sola vez.
    stdout.write(buffer.toString());
  }
}
