// ---------------------------------------------------------------------------
// ENTRADA DE TECLADO
// ---------------------------------------------------------------------------
// Lee las pulsaciones del usuario en tiempo real (sin esperar a que pulse
// "Enter"), algo imprescindible para un juego en la consola.
// ---------------------------------------------------------------------------

import 'dart:io';

/// Configura `stdin` para leer carácter a carácter y llama a [onTecla] cada
/// vez que el usuario pulsa una tecla.
///
/// Detalles importantes:
///   - `lineMode = false`: no espera a que se pulse Enter.
///   - `echoMode = false`: no muestra en pantalla lo que se escribe.
///
/// [onTecla] recibe la tecla ya convertida a minúsculas para simplificar
/// las comparaciones (por ejemplo 'W' y 'w' se tratan igual).
void configurarTeclado(void Function(String) onTecla) {
  stdin.lineMode = false;
  stdin.echoMode = false;

  // stdin es un Stream de bytes; cada byte (o bloque) es una tecla pulsada.
  stdin.listen((List<int> codigos) {
    for (final code in codigos) {
      final char = String.fromCharCode(code).toLowerCase();
      onTecla(char);
    }
  });
}
