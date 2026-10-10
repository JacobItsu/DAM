# Actividad 4 — Ping Pong con Flutter + Flame

Migración del clásico Ping Pong desde la versión de consola (Actividad 2) a una aplicación Flutter visual usando el framework **Flame**. Se reutiliza la lógica de las entidades (`Pelota`, `Paleta`, `Marcador`) del proyecto de consola, separando la representación gráfica de la lógica del juego.

## Objetivo

- Migrar un juego de consola a Flutter.
- Introducción a Flame (Game, GameWidget, Component, update loop).
- Reutilizar código existente (`entities.dart`).
- Implementar navegación entre menú y partida.
- Controles por teclado (W/S/I/K).

## Funcionalidad

- **Menú inicial**: Presentación del juego con controles y botón "JUGAR".
- **Partida visual**: Tablero oscuro, línea central, paletas blancas, bola blanca y marcador.
- **Controles**:
  - Jugador 1: `W` (arriba) / `S` (abajo)
  - Jugador 2: `I` (arriba) / `K` (abajo)
  - Salir: `Q` (vuelve al menú o cierra según contexto)
- **Lógica reutilizada**: Rebotes, límites, anotación de puntos.
- **Multiplataforma**: Generado para Windows, Web y Android.

## Requisitos

- Flutter 3.47.x (o compatible con `sdk: ^3.13.4`)
- Paquete `flame: ^1.38.2`
- Para Web: Chrome (recomendado)
- Para Windows: SDK de Windows habilitado (`flutter config --enable-windows-desktop`)
- Para Android: Android SDK

## Cómo ejecutar

Desde la carpeta de esta actividad:

```bash
flutter pub get
flutter run              # Elige dispositivo (chrome/emulador/windows)
```

Para ejecutar en web específicamente:

```bash
flutter run -d chrome
```

## Análisis y tests

```bash
flutter analyze
flutter test
```

## Estructura

```
Actividad4_PinPonFlame/
├── lib/
│   ├── main.dart                    # Raíz de la app
│   ├── entities.dart                # Lógica reutilizada (Pelota, Paleta, Marcador)
│   ├── game/
│   │   └── pinpon_game.dart         # PinPonGame (Flame), componentes visuales
│   └── screens/
│       ├── menu_screen.dart         # Menú inicial
│       └── game_screen.dart         # Pantalla con GameWidget
├── test/
│   └── widget_test.dart             # Test del menú
├── pubspec.yaml
└── README.md
```

## Diferencias con la versión de consola (Actividad 2)

| Aspecto | Consola | Flame |
|---|---|---|
| Renderizado | Caracteres ASCII + ANSI | Widgets/Componentes gráficos 2D |
| Bucle | `Timer.periodic` manual | `update(double dt)` de Flame |
| Entrada | `stdin.listen` (carácter a carácter) | `HasKeyboardHandlerComponents` (KeyEvent) |
| Medidas | Celdas (enteros) | Pixels (double) |
| Separación | render/input/menu/bin/lib | game/screens/main/entities |

## Conceptos Flame utilizados

- `FlameGame`: Clase base del juego.
- `GameWidget`: Widget que renderiza el juego.
- `CircleComponent`, `RectangleComponent`, `TextComponent`: Componentes visuales.
- `HasKeyboardHandlerComponents`: Manejo de teclado.
- `update(dt)`: Lógica por frame con delta time.

## Notas

- La lógica pura (`entities.dart`) es idéntica en espíritu a la de Actividad 2, adaptada a valores `double` para facilitar la interpolación con Flame.
- El juego mantiene la misma mecánica: rebote con paletas/techo/suelo, anotación al salir por los laterales.
- Para salir del juego se usa `Q` o el botón de retroceso.
