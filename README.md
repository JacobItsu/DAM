# Repositorio de Actividades - DAM (Desarrollo de Aplicaciones Multiplataforma)

Este repositorio recoge las actividades realizadas durante el curso de DAM. Cada actividad está organizada en su propia carpeta, con código fuente comentado, documentación y, cuando aplica, tests.

## Estructura general

```
DAM/
├── Actividades/
│   ├── Actividad1_Calculadora/      # Dart - Consola
│   ├── Actividad2_PinPonConsola/    # Dart + Dart CLI - Juego Ping Pong
│   ├── Actividad3_Navegacion/       # Flutter - Navegación entre 2 pantallas
│   └── Actividad4_PinPonFlame/      # Flutter + Flame - Ping Pong visual
├── .gitattributes
└── README.md
```

## Índice de actividades

| Actividad | Tecnología | Descripción |
|---|---|---|
| **Actividad 1** | Dart (CLI) | Calculadora básica por consola con validaciones y formato de resultados. |
| **Actividad 2** | Dart (CLI) | Ping Pong para terminal con modo 1 vs IA, modo 2 jugadores, dificultad y tests unitarios. |
| **Actividad 3** | Flutter | App con dos pantallas y navegación mediante `Navigator.push/pop`. Orientada a Android. |
| **Actividad 4** | Flutter + Flame | Migración del Ping Pong a versión visual con Flame. Multiplataforma (Android/Web/Windows). |

## Cómo ejecutar

### Actividades Dart (1 y 2)

Necesitarás tener Dart SDK instalado (o usar el `dart-sdk` incluido en Actividad1). Desde la carpeta de la actividad:

```bash
dart pub get  # solo si hay pubspec.yaml
dart run bin/<fichero>.dart
```

### Actividades Flutter (3 y 4)

Necesitarás Flutter SDK 3.x. Desde la carpeta de la actividad:

```bash
flutter pub get
flutter run
```

Para listar dispositivos disponibles: `flutter devices`.

## Análisis y pruebas

- **Dart**: `dart analyze` / `dart test`
- **Flutter**: `flutter analyze` / `flutter test`

## Convenciones

- Código ampliamente comentado en español.
- Lógica separada de la presentación cuando ha sido posible (especialmente Actividad 2).
- Tests unitarios para la lógica pura (Actividad 2).
- READMEs detallados por actividad.

## Créditos

Ejercicios prácticos para el módulo de Desarrollo de Aplicaciones Multiplataforma (DAM).
