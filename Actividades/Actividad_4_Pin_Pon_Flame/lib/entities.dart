// ---------------------------------------------------------------------------
// ENTIDADES (LÓGICA COMPARTIDA DEL JUEGO)
// ---------------------------------------------------------------------------
// Clases que modelan el estado del Ping Pong. Se pueden reutilizar tanto
// en la versión de consola (Actividad 2) como en la versión con Flame
// (Actividad 4), separando la lógica de la representación visual.
// ---------------------------------------------------------------------------

/// Representa la cuenta de puntos de ambos jugadores.
class Marcador {
  /// Puntos del jugador 1 (izquierda).
  int jugador1 = 0;

  /// Puntos del jugador 2 (derecha).
  int jugador2 = 0;
}

/// La bola del juego.
class Pelota {
  /// Posición horizontal (en unidades de juego).
  double x;

  /// Posición vertical (en unidades de juego).
  double y;

  /// Velocidad horizontal: +1 (derecha), -1 (izquierda).
  double dx;

  /// Velocidad vertical: +1 (abajo), -1 (arriba).
  double dy;

  Pelota({required this.x, required this.y, this.dx = 1, this.dy = 1});

  /// Mueve la bola un paso según su dirección.
  void mover() {
    x += dx;
    y += dy;
  }

  /// Invierte la dirección vertical (rebote contra techo/suelo).
  void rebotarY() {
    dy = -dy;
  }

  /// Invierte la dirección horizontal (rebote contra paleta).
  void rebotarX() {
    dx = -dx;
  }

  /// Reinicia la bola en el centro y la envía hacia el contrario.
  void reiniciar(double centroX, double centroY) {
    x = centroX;
    y = centroY;
    dx = -dx;
  }
}

/// Paleta (raqueta) que controla un jugador.
class Paleta {
  /// Posición vertical superior (en unidades de juego).
  double y;

  /// Posición horizontal fija (en unidades de juego).
  final double x;

  /// Altura de la paleta (en unidades de juego).
  final double alto;

  /// Velocidad de movimiento vertical.
  double velocidad;

  Paleta({
    required this.x,
    required this.y,
    required this.alto,
    this.velocidad = 0,
  });

  /// Mueve la paleta hacia arriba.
  void moverArriba(double limiteSuperior) {
    y = y.clamp(limiteSuperior, double.infinity);
    if (y > limiteSuperior) {
      y -= velocidad > 0 ? velocidad : 1;
    }
  }

  /// Mueve la paleta hacia abajo.
  void moverAbajo(double limiteInferior) {
    final maxY = limiteInferior - alto;
    if (y < maxY) {
      y += velocidad > 0 ? velocidad : 1;
    }
    y = y.clamp(double.negativeInfinity, maxY);
  }
}
