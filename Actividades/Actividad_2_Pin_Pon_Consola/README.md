# Actividad 2 — Ping Pong de consola en Dart

Versión de consola (terminal) del clásico juego **Ping Pong**, escrita en Dart
puro. Es la base que luego se migra a Flutter + Flame en la **Actividad 4**.

## Funcionalidad

- Dos modos de juego:
  - **1 jugador vs. IA**: la máquina sigue la bola automáticamente.
  - **2 jugadores**: ambos comparten el teclado.
- Tres niveles de dificultad que cambian la velocidad del juego.
- Marcador en pantalla para cada jugador.
- Renderizado con caracteres ASCII y códigos ANSI (sin librerías externas).
- Salida limpia: restaura la terminal al salir.

## Controles

| Acción                 | Tecla        |
| ---------------------- | ------------ |
| Jugador 1 (arriba)     | `W`          |
| Jugador 1 (abajo)      | `S`          |
| Jugador 2 (arriba)     | `I`          |
| Jugador 2 (abajo)      | `K`          |
| Salir                  | `Q` / `Ctrl+C` |

## Requisitos

- Dart SDK 3.x.

## Cómo ejecutar

Desde la carpeta de esta actividad:

```bash
dart pub get      # descarga dependencias (solo la primera vez)
dart run bin/pin_pon.dart
```

## Pruebas

```bash
dart test
```

Las pruebas cubren la lógica pura (movimiento de la pelota, rebotes, límites de
las paletas y movimiento de la IA) sin depender de la consola.

## Estructura

```
Actividad2_PinPonConsola/
├── bin/
│   └── pin_pon.dart        # Punto de entrada + bucle del juego
├── lib/
│   ├── pin_pon.dart        # Librería que reexporta todos los módulos
│   ├── entities.dart       # Pelota, Paleta y Marcador (lógica)
│   ├── game_config.dart    # Constantes y enums (tamaños, dificultad)
│   ├── input.dart          # Lectura del teclado en tiempo real
│   ├── menu.dart           # Menús previos a la partida
│   └── render.dart         # Dibujado del tablero en consola
└── test/
    └── pin_pon_test.dart   # Pruebas unitarias de la lógica
```

## Arquitectura

El código separa claramente la **lógica** de la **presentación**:

- `entities.dart` no sabe nada de consola: solo mueve objetos.
- `render.dart` se encarga únicamente de pintar el estado actual.
- `input.dart` traduce pulsaciones de teclas en acciones.

Gracias a esta separación, el salto a Flutter + Flame (Actividad 4) consiste en
sustituir `render.dart`, `input.dart` y el bucle `Timer` por sus equivalentes de
Flame, reutilizando casi tal cual la lógica de `entities.dart`.

## Conceptos practicados

- Programación orientada a objetos (clases, estado, métodos).
- `dart:async` (`Timer.periodic`) para un *game loop*.
- `dart:io` y códigos ANSI para la terminal.
- Enumeraciones (`enum`) y constantes centralizadas.
- Pruebas unitarias con `package:test`.
