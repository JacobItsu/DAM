// ---------------------------------------------------------------------------
// ENTIDADES DEL JUEGO
// ---------------------------------------------------------------------------
// Aquí viven los "objetos" que forman el juego:
//   - Pelota: se mueve por la pantalla y rebota.
//   - Paleta: la barra que controla cada jugador (o la IA).
//
// Ambas clases son independientes de la forma en que se dibujan, lo que
// facilita reutilizarlas más adelante (por ejemplo, al migrar a Flutter+Flame).
// ---------------------------------------------------------------------------

/// La bola del juego, representada por una posición (x, y) dentro de la
/// cuadrícula de consola y una dirección de movimiento (dx, dy).
class Pelota {
  /// Posición horizontal actual (columna).
  int x;

  /// Posición vertical actual (fila).
  int y;

  /// Dirección horizontal: `1` (derecha) o `-1` (izquierda).
  int dx;

  /// Dirección vertical: `1` (abajo) o `-1` (arriba).
  int dy;

  Pelota({required this.x, required this.y, this.dx = 1, this.dy = 1});

  /// Avanza la bola un paso en la dirección actual.
  void mover() {
    x += dx;
    y += dy;
  }

  /// Invierte la dirección vertical (rebote contra el techo o el suelo).
  void rebotarY() => dy = -dy;

  /// Invierte la dirección horizontal (rebote contra una paleta).
  void rebotarX() => dx = -dx;

  /// Coloca la bola en el centro ([centroX], [centroY]) tras un punto.
  ///
  /// Se invierte `dx` para que la bola salga hacia el jugador que NO anotó.
  void reiniciar(int centroX, int centroY) {
    x = centroX;
    y = centroY;
    dx = -dx;
  }
}

/// Lleva la cuenta de los puntos de ambos jugadores.
///
/// Se encapsula en una clase (en vez de dos variables sueltas) para poder
/// pasarla por referencia a las funciones que actualizan el juego.
class Marcador {
  /// Puntos del jugador de la izquierda.
  int jugador1 = 0;

  /// Puntos del jugador de la derecha.
  int jugador2 = 0;
}

/// La paleta (o "raqueta") que controla un jugador.
///
/// La posición horizontal [x] y el alto [alto] son fijos; solo la posición
/// vertical [y] cambia cuando el jugador sube o baja.
class Paleta {
  /// Borde superior de la paleta (fila).
  int y;

  /// Columna fija donde se dibuja la paleta.
  final int x;

  /// Cantidad de celdas que ocupa la paleta de alto.
  final int alto;

  Paleta({required this.x, required this.y, required this.alto});

  /// Sube la paleta una fila, sin salir por arriba (límite y = 1).
  void moverArriba() {
    if (y > 1) y--;
  }

  /// Baja la paleta una fila, sin salir por abajo.
  ///
  /// [limiteInferior] es la altura total del tablero para no traspasar el borde.
  void moverAbajo(int limiteInferior) {
    if (y + alto < limiteInferior - 1) y++;
  }

  /// Movimiento automático de la IA cuando el modo es "contra la máquina".
  ///
  /// Intenta centrar la paleta con la bola siguiendo estas reglas:
  ///   - Si la bola está por debajo del centro, baja.
  ///   - Si está por encima, sube.
  /// [velocidad] permite que la IA sea más rápida en dificultad difícil.
  void moverIA(int pelotaY, int limiteInferior, {int velocidad = 1}) {
    final centroPaleta = y + (alto ~/ 2);

    if (centroPaleta < pelotaY - 1 && y + alto < limiteInferior - 1) {
      y += velocidad;
    } else if (centroPaleta > pelotaY + 1 && y > 1) {
      y -= velocidad;
    }
  }
}
