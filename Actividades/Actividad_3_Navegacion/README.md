# Actividad 3 — Navegación entre dos pantallas con Flutter

Aplicación Flutter muy sencilla que muestra dos pantallas con un mensaje
distinto cada una. La transición entre ellas se realiza con `Navigator.push`,
mientras que para volver se usa `Navigator.pop`.

## Objetivo

- Practicar la navegación entre pantallas.
- Usar `MaterialApp`, `Scaffold`, `AppBar` y widgets básicos.
- Estructurar el proyecto: separar `screens/` y `widgets/` con código comentado.
- Implementar un botón fijo en la parte inferior.

## Funcionalidad

- Pantalla 1: Muestra "Bienvenido" e información sobre la actividad.
- Botón "Ir a la segunda pantalla" que lleva a la pantalla 2.
- Pantalla 2: Muestra otro mensaje y permite volver.
- Animación de transición proporcionada por `MaterialPageRoute`.
- Diseño limpio y centrado.

## Requisitos

- Flutter SDK 3.47.x (o compatible con `sdk: ^3.13.4`).
- Dispositivo Android, emulador, o `flutter run -d chrome`.

## Cómo ejecutar

Desde la carpeta de esta actividad:

```bash
flutter pub get
flutter run
```

## Análisis estático

```bash
flutter analyze
```

## Estructura

```
Actividad3_Navegacion/
├── lib/
│   ├── main.dart                    # Raíz de la app (MiApp)
│   ├── screens/
│   │   ├── pantalla_inicio.dart     # Pantalla 1
│   │   └── pantalla_secundaria.dart # Pantalla 2
│   └── widgets/
│       └── boton_inferior.dart      # Botón reutilizable
├── test/
│   └── widget_test.dart             # Test de ejemplo
├── pubspec.yaml
├── analysis_options.yaml
├── .gitignore
└── README.md
```

## Conceptos practicados

- `StatelessWidget`: widgets sin estado.
- `Navigator.push` / `Navigator.pop` para la pila de rutas.
- `MaterialPageRoute` para la animación.
- `Scaffold`, `AppBar`, `Column`, `Expanded`, `Center`, `SafeArea`, `Padding`.
- Separación en capas: `main`, `screens`, `widgets`.
- Reutilización de componentes.

## Nota

Las carpetas `android/`, `.idea/`, `build/`, `.dart_tool/` siguen las normas
habituales de un proyecto Flutter y no necesitan comentarios adicionales.
