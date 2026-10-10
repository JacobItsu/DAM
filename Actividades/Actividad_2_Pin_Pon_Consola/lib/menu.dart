// ---------------------------------------------------------------------------
// MENÚS DE LA CONSOLA
// ---------------------------------------------------------------------------
// Se encarga de la interfaz previa a la partida: elegir modo de juego,
// dificultad y mostrar los controles.
// ---------------------------------------------------------------------------

import 'dart:io';
import 'game_config.dart';

/// Conjunto de pantallas y preguntas que se muestran antes de jugar.
///
/// Todos los métodos son `static` porque no necesitamos guardar estado entre
/// pantallas: son utilidades de presentación.
class Menu {
  /// Imprime el menú principal (elegir modo de juego).
  static void mostrarMenuPrincipal() {
    _limpiarPantalla();
    print('╔═══════════════════════════════════════════╗');
    print('║           P I N G   P O N G              ║');
    print('╠═══════════════════════════════════════════╣');
    print('║  1. Jugar contra otro jugador            ║');
    print('║  2. Jugar contra IA                      ║');
    print('║  3. Salir                                ║');
    print('╚═══════════════════════════════════════════╝');
    stdout.write('\nSelecciona una opción (1-3): ');
  }

  /// Imprime el menú de selección de dificultad.
  static void mostrarMenuDificultad() {
    _limpiarPantalla();
    print('╔═══════════════════════════════════════════╗');
    print('║          SELECCIONA DIFICULTAD           ║');
    print('╠═══════════════════════════════════════════╣');
    print('║  1. Fácil   (Velocidad lenta)            ║');
    print('║  2. Normal  (Velocidad media)            ║');
    print('║  3. Difícil (Velocidad rápida)           ║');
    print('╚═══════════════════════════════════════════╝');
    stdout.write('\nSelecciona una opción (1-3): ');
  }

  /// Pregunta el modo de juego hasta recibir una opción válida.
  ///
  /// La opción `3` termina el programa.
  static GameMode seleccionarModo() {
    while (true) {
      mostrarMenuPrincipal();
      final input = stdin.readLineSync()?.trim();

      switch (input) {
        case '1':
          return GameMode.vsJugador;
        case '2':
          return GameMode.vsIA;
        case '3':
          exit(0); // Cierra el programa inmediatamente.
        default:
          print('Opción inválida. Presiona Enter para continuar...');
          stdin.readLineSync();
      }
    }
  }

  /// Pregunta la dificultad hasta recibir una opción válida.
  static Dificultad seleccionarDificultad() {
    while (true) {
      mostrarMenuDificultad();
      final input = stdin.readLineSync()?.trim();

      switch (input) {
        case '1':
          return Dificultad.facil;
        case '2':
          return Dificultad.normal;
        case '3':
          return Dificultad.dificil;
        default:
          print('Opción inválida. Presiona Enter para continuar...');
          stdin.readLineSync();
      }
    }
  }

  /// Aplica la [dificultad] elegida modificando la velocidad de refresco
  /// global ([GameConfig.frameRate]).
  static void configurarDificultad(Dificultad dificultad) {
    switch (dificultad) {
      case Dificultad.facil:
        GameConfig.frameRate = GameConfig.dificultades['Fácil']!;
      case Dificultad.normal:
        GameConfig.frameRate = GameConfig.dificultades['Normal']!;
      case Dificultad.dificil:
        GameConfig.frameRate = GameConfig.dificultades['Difícil']!;
    }
  }

  /// Muestra en pantalla los controles disponibles según el [modo].
  static void mostrarControles(GameMode modo) {
    _limpiarPantalla();
    print('╔═══════════════════════════════════════════╗');
    print('║              CONTROLES                   ║');
    print('╠═══════════════════════════════════════════╣');
    print('║  Jugador 1:  W (arriba)  S (abajo)       ║');
    if (modo == GameMode.vsJugador) {
      print('║  Jugador 2:  I (arriba)  K (abajo)       ║');
    } else {
      print('║  Jugador 2:  Controlado por IA           ║');
    }
    print('║  Salir:      Q                           ║');
    print('╚═══════════════════════════════════════════╝');
    print('\nPresiona Enter para comenzar...');
    stdin.readLineSync();
  }

  /// Borra la pantalla y coloca el cursor en la esquina superior izquierda.
  ///
  /// `\x1B[2J` borra todo y `\x1B[H` mueve el cursor al origen (fila 1, col 1).
  static void _limpiarPantalla() {
    stdout.write('\x1B[2J\x1B[H');
  }
}
