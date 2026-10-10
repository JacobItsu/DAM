// ---------------------------------------------------------------------------
// JUEGO CON FLAME
// ---------------------------------------------------------------------------
// Implementa el juego reutilizando la lógica de entities.dart (Pelota, Paleta,
// Marcador). Controles: W/S (Jugador 1), I/K (Jugador 2).
// ---------------------------------------------------------------------------

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../entities.dart';

/// Constantes de medidas para el tablero Flame.
class GameConfig {
  static const double ancho = 800;
  static const double alto = 400;
  static const double paletaAncho = 10;
  static const double paletaAlto = 60;
  static const double radioPelota = 6;
}

/// Componente visual de la bola.
class Bola extends CircleComponent with HasGameReference<PinPonGame> {
  Bola({required super.position, required double radio})
      : super(radius: radio, anchor: Anchor.center);

  @override
  Paint get paint => Paint()..color = Colors.white;
}

/// Componente visual de la paleta.
class PaletaComponent extends RectangleComponent {
  PaletaComponent({required super.position, required super.size})
      : super(anchor: Anchor.topCenter);

  @override
  Paint get paint => Paint()..color = Colors.white;
}

/// Componente de texto para mostrar el marcador.
class MarcadorTexto extends TextComponent {
  MarcadorTexto({required super.position})
      : super(
          text: '0  |  0',
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'monospace',
            ),
          ),
          anchor: Anchor.topCenter,
        );

  void actualizar(int j1, int j2) {
    text = '$j1  |  $j2';
  }
}

/// Juego principal de Ping Pong.
class PinPonGame extends FlameGame with HasKeyboardHandlerComponents {
  late Pelota pelotaLogica;
  late Paleta paletaJ1Logica;
  late Paleta paletaJ2Logica;
  final Marcador marcador = Marcador();

  late Bola bola;
  late PaletaComponent paletaJ1;
  late PaletaComponent paletaJ2;
  late MarcadorTexto marcadorTexto;

  bool w = false;
  bool s = false;
  bool i = false;
  bool k = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    pelotaLogica = Pelota(
      x: GameConfig.ancho / 2,
      y: GameConfig.alto / 2,
      dx: 200,
      dy: 200,
    );

    paletaJ1Logica = Paleta(
      x: GameConfig.paletaAncho + 5,
      y: GameConfig.alto / 2 - GameConfig.paletaAlto / 2,
      alto: GameConfig.paletaAlto,
      velocidad: 250,
    );

    paletaJ2Logica = Paleta(
      x: GameConfig.ancho - GameConfig.paletaAncho - 5,
      y: GameConfig.alto / 2 - GameConfig.paletaAlto / 2,
      alto: GameConfig.paletaAlto,
      velocidad: 250,
    );

    bola = Bola(
      position: Vector2(pelotaLogica.x, pelotaLogica.y),
      radio: GameConfig.radioPelota,
    );

    paletaJ1 = PaletaComponent(
      position: Vector2(paletaJ1Logica.x, paletaJ1Logica.y + GameConfig.paletaAlto / 2),
      size: Vector2(GameConfig.paletaAncho, GameConfig.paletaAlto),
    );

    paletaJ2 = PaletaComponent(
      position: Vector2(paletaJ2Logica.x, paletaJ2Logica.y + GameConfig.paletaAlto / 2),
      size: Vector2(GameConfig.paletaAncho, GameConfig.paletaAlto),
    );

    marcadorTexto = MarcadorTexto(
      position: Vector2(GameConfig.ancho / 2, 10),
    );

    add(RectangleComponent(
      position: Vector2.zero(),
      size: Vector2(GameConfig.ancho, GameConfig.alto),
      paint: Paint()..color = const Color(0xFF1E1E1E),
    ));

    add(marcadorTexto);
    add(bola);
    add(paletaJ1);
    add(paletaJ2);

    add(RectangleComponent(
      position: Vector2(GameConfig.ancho / 2 - 2, 0),
      size: Vector2(4, GameConfig.alto),
      paint: Paint()..color = Colors.white30,
    ));
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);

    final isKeyDown = event is KeyDownEvent;

    if (event.logicalKey == LogicalKeyboardKey.keyW) {
      w = isKeyDown;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyS) {
      s = isKeyDown;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyI) {
      i = isKeyDown;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyK) {
      k = isKeyDown;
    }

    if (event.logicalKey == LogicalKeyboardKey.keyQ && isKeyDown) {
      SystemNavigator.pop();
    }

    return KeyEventResult.handled;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (w) {
      paletaJ1Logica.y -= paletaJ1Logica.velocidad * dt;
    }
    if (s) {
      paletaJ1Logica.y += paletaJ1Logica.velocidad * dt;
    }

    if (i) {
      paletaJ2Logica.y -= paletaJ2Logica.velocidad * dt;
    }
    if (k) {
      paletaJ2Logica.y += paletaJ2Logica.velocidad * dt;
    }

    paletaJ1Logica.y = paletaJ1Logica.y.clamp(0, GameConfig.alto - paletaJ1Logica.alto);
    paletaJ2Logica.y = paletaJ2Logica.y.clamp(0, GameConfig.alto - paletaJ2Logica.alto);

    paletaJ1.position = Vector2(paletaJ1Logica.x, paletaJ1Logica.y + GameConfig.paletaAlto / 2);
    paletaJ2.position = Vector2(paletaJ2Logica.x, paletaJ2Logica.y + GameConfig.paletaAlto / 2);

    pelotaLogica.x += pelotaLogica.dx * dt;
    pelotaLogica.y += pelotaLogica.dy * dt;

    if (pelotaLogica.y <= GameConfig.radioPelota ||
        pelotaLogica.y >= GameConfig.alto - GameConfig.radioPelota) {
      pelotaLogica.rebotarY();
    }

    if (pelotaLogica.x <= paletaJ1Logica.x + GameConfig.paletaAncho / 2 + GameConfig.radioPelota &&
        pelotaLogica.x >= paletaJ1Logica.x &&
        pelotaLogica.y >= paletaJ1Logica.y &&
        pelotaLogica.y <= paletaJ1Logica.y + paletaJ1Logica.alto) {
      pelotaLogica.rebotarX();
    }

    if (pelotaLogica.x >= paletaJ2Logica.x - GameConfig.paletaAncho / 2 - GameConfig.radioPelota &&
        pelotaLogica.x <= paletaJ2Logica.x &&
        pelotaLogica.y >= paletaJ2Logica.y &&
        pelotaLogica.y <= paletaJ2Logica.y + paletaJ2Logica.alto) {
      pelotaLogica.rebotarX();
    }

    if (pelotaLogica.x < 0) {
      marcador.jugador2++;
      pelotaLogica.reiniciar(GameConfig.ancho / 2, GameConfig.alto / 2);
      marcadorTexto.actualizar(marcador.jugador1, marcador.jugador2);
    } else if (pelotaLogica.x > GameConfig.ancho) {
      marcador.jugador1++;
      pelotaLogica.reiniciar(GameConfig.ancho / 2, GameConfig.alto / 2);
      marcadorTexto.actualizar(marcador.jugador1, marcador.jugador2);
    }

    bola.position = Vector2(pelotaLogica.x, pelotaLogica.y);
  }
}
