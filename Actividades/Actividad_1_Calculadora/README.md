# Actividad 1 — Calculadora de consola en Dart

Calculadora básica de línea de comandos escrita en Dart puro. Fue la primera
actividad y sirve como introducción a la entrada/salida por consola.

## Funcionalidad

- Suma, resta, multiplicación y división.
- Bucle continuo: puedes realizar varias operaciones sin reiniciar.
- Validación de entradas (avisa si escribes algo que no es un número).
- Control de la división entre cero.
- Acepta punto (`1.5`) o coma (`1,5`) como separador decimal.
- Formatea los resultados enteros sin decimales (`4` en lugar de `4.0`).

## Requisitos

- Dart SDK 3.x (o el SDK incluido en la carpeta `dart-sdk/`).

## Cómo ejecutar

Desde la carpeta de esta actividad:

```bash
dart run bin/calculadora.dart
```

O directamente con el binario compilado (Windows):

```powershell
.\bin\calculadora.exe
```

También puedes compilar un ejecutable propio con:

```bash
dart compile exe bin/calculadora.dart -o bin/calculadora_compilada.exe
```

## Estructura

```
Actividad1_Calculadora/
├── bin/
│   ├── calculadora.dart   # Código fuente (comentado)
│   └── calculadora.exe    # Ejecutable compilado de Windows
└── dart-sdk/              # SDK de Dart incluido (entorno local)
```

## Conceptos practicados

- `dart:io` para leer del teclado (`stdin`) y escribir en pantalla (`stdout`).
- `enum` para representar las opciones del menú.
- `while`, `switch`, `continue` y `break`.
- Funciones y separación de responsabilidades (mostrar, pedir, calcular, formatear).
- Manejo de valores nulos (`double?`, `tryParse`).

## Nota

El archivo `.exe` y el SDK incluido son artefactos locales. Se recomienda no
versionarlos en Git (ver el README principal del repositorio).
