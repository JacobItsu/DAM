// ---------------------------------------------------------------------------
// PUNTO DE ENTRADA DEL JUEGO (consola)
// ---------------------------------------------------------------------------
// Actividad 2: Ping Pong para terminal.
//
// Cómo ejecutar:
//   dart run bin/pin_pon.dart
//
// El juego usa un Timer para crear un "game loop": cada cierto intervalo
// (según la dificultad) mueve la bola, comprueba rebotes y redibuja el tablero.
// ---------------------------------------------------------------------------

import 'dart:async';
import 'dart:io';

import 'package:pin_pon/entities.dart';
import 'package:pin_pon/game_config.dart';
import 'package:pin_pon/input.dart';
import 'package:pin_pon/menu.dart';
import 'package:pin_pon/pin_pon.dart' show saludo;
import 'package:pin_pon/render.dart';

void main() {
  // Limpiamos la pantalla y mostramos el saludo del juego.
  stdout.write('\x1B[2J\x1B[H');
  stdout.write(saludo());

  // ----- Configuración previa a la partida -----
  final modo = Menu.seleccionarModo();
  final dificultad = Menu.seleccionarDificultad();
  Menu.configurarDificultad(dificultad);
  Menu.mostrarControles(modo);

  // Ocultamos el cursor para que no "baile" durante el juego.
  stdout.write('\x1B[?25l');

  // ----- Creación de las entidades -----
  // La bola empieza en el centro del tablero.
  final pelota = Pelota(
    x: GameConfig.ancho ~/ 2,
    y: GameConfig.alto ~/ 2,
  );

  // Paletas: una a la izquierda (x=2) y otra a la derecha.
  final j1 = Paleta(x: 2, y: 8, alto: GameConfig.tamanoPaleta);
  final j2 = Paleta(
    x: GameConfig.ancho - 3,
    y: 8,
    alto: GameConfig.tamanoPaleta,
  );

  // Marcador compartido con el bucle del juego.
  final marcador = Marcador();

  // ----- Entrada de teclado -----
  // Cada tecla se traduce en un movimiento de paleta o en salir del juego.
  configurarTeclado((tecla) {
    if (tecla == 'w') j1.moverArriba();
    if (tecla == 's') j1.moverAbajo(GameConfig.alto);

    // En modo 2 jugadores, el jugador 2 usa las teclas I / K.
    if (modo == GameMode.vsJugador) {
      if (tecla == 'i') j2.moverArriba();
      if (tecla == 'k') j2.moverAbajo(GameConfig.alto);
    }

    // 'q' restaura la terminal y cierra el programa.
    if (tecla == 'q') {
      restaurarTerminal();
      exit(0);
    }
  });

  // ----- Bucle principal del juego -----
  // Timer.periodic repite esta función cada GameConfig.frameRate.
  Timer.periodic(GameConfig.frameRate, (timer) {
    _actualizar(pelota, j1, j2, marcador, modo, dificultad);
    Renderer.dibujar(
      pelota,
      j1,
      j2,
      marcador.jugador1,
      marcador.jugador2,
    );
  });

  // Si el usuario cierra con Ctrl+C, restauramos la terminal antes de salir.
  ProcessSignal.sigint.watch().listen((_) {
    restaurarTerminal();
    exit(0);
  });
}

// ---------------------------------------------------------------------------
// LÓGICA DEL FOTOGRAMA
// ---------------------------------------------------------------------------

/// Avanza un fotograma: mueve la bola, resuelve rebotes, actualiza la IA y
/// detecta si alguien anotó un punto.
void _actualizar(
  Pelota pelota,
  Paleta j1,
  Paleta j2,
  Marcador marcador,
  GameMode modo,
  Dificultad dificultad,
) {
  pelota.mover();

  // Rebote contra el techo (y = 0) o el suelo (y = alto - 1).
  if (pelota.y <= 0 || pelota.y >= GameConfig.alto - 1) {
    pelota.rebotarY();
  }

  // Rebote contra la paleta del jugador 1.
  if (pelota.x == j1.x + 1 &&
      pelota.y >= j1.y &&
      pelota.y < j1.y + j1.alto) {
    pelota.rebotarX();
  }

  // Rebote contra la paleta del jugador 2.
  if (pelota.x == j2.x - 1 &&
      pelota.y >= j2.y &&
      pelota.y < j2.y + j2.alto) {
    pelota.rebotarX();
  }

  // La IA solo se mueve si el modo es "contra la máquina".
  if (modo == GameMode.vsIA) {
    final velocidadIA = dificultad == Dificultad.dificil ? 2 : 1;
    j2.moverIA(pelota.y, GameConfig.alto, velocidad: velocidadIA);
  }

  // Punto para el jugador 2 si la bola sale por la izquierda.
  if (pelota.x <= 0) {
    marcador.jugador2++;
    pelota.reiniciar(GameConfig.ancho ~/ 2, GameConfig.alto ~/ 2);
  }
  // Punto para el jugador 1 si la bola sale por la derecha.
  else if (pelota.x >= GameConfig.ancho - 1) {
    marcador.jugador1++;
    pelota.reiniciar(GameConfig.ancho ~/ 2, GameConfig.alto ~/ 2);
  }
}

/// Restaura el estado de la terminal que modificamos al iniciar el juego.
///
/// Vuelve a mostrar el cursor y reactiva el modo línea y el eco de `stdin`.
void restaurarTerminal() {
  stdout.write('\x1B[?25h');
  stdin.lineMode = true;
  stdin.echoMode = true;
}
