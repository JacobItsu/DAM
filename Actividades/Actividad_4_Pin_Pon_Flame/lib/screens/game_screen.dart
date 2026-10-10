// ---------------------------------------------------------------------------
// PANTALLA DE JUEGO
// ---------------------------------------------------------------------------

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/pinpon_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = PinPonGame();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: SizedBox(
              width: GameConfig.ancho,
              height: GameConfig.alto,
              child: GameWidget(game: game),
            ),
          ),
        ),
      ),
    );
  }
}
