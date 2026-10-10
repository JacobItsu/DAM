// ---------------------------------------------------------------------------
// CONFIGURACIÓN GLOBAL DEL JUEGO
// ---------------------------------------------------------------------------
// Centraliza los valores que definen el tamaño del tablero, el tamaño de las
// paletas y las velocidades según la dificultad elegida.
// ---------------------------------------------------------------------------

/// Constantes de configuración del juego.
///
/// Se declara como `abstract class` para que solo se usen sus miembros
/// estáticos (una clase "contenedor" de constantes, sin instancias).
abstract class GameConfig {
  /// Ancho del tablero en celdas de consola (incluye los dos bordes).
  static const int ancho = 40;

  /// Alto del tablero en celdas de consola (incluye bordes superior e inferior).
  static const int alto = 20;

  /// Número de celdas que ocupa cada paleta.
  static const int tamanoPaleta = 4;

  /// Velocidad (frecuencia de refresco) asociada a cada dificultad.
  ///
  /// A menor duración, más rápido se mueve todo el juego.
  static const Map<String, Duration> dificultades = {
    'Fácil': Duration(milliseconds: 80),
    'Normal': Duration(milliseconds: 50),
    'Difícil': Duration(milliseconds: 30),
  };

  /// Duración del frame actual. Se sobrescribe al elegir dificultad.
  static Duration frameRate = Duration(milliseconds: 50);
}

/// Modo de juego elegido por el usuario.
enum GameMode {
  /// Dos jugadores humanos en el mismo teclado.
  vsJugador,

  /// Un jugador humano contra la máquina.
  vsIA,
}

/// Nivel de dificultad que ajusta la velocidad de la partida.
enum Dificultad { facil, normal, dificil }
