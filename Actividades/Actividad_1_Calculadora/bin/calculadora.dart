// ---------------------------------------------------------------------------
// ACTIVIDAD 1 - CALCULADORA DE CONSOLA EN DART
// ---------------------------------------------------------------------------
// Objetivo:
//   Practicar la entrada/salida por consola (dart:io) y las estructuras de
//   control (while, switch, if) construyendo una calculadora básica.
//
// Cómo ejecutar:
//   dart run bin/calculadora.dart        (o)   dart bin/calculadora.dart
//
// Operaciones soportadas:
//   1) Suma        (+)      2) Resta       (-)
//   3) Multiplicación (*)   4) División    (/)
//   0) Salir
// ---------------------------------------------------------------------------

// 'dart:io' nos da acceso a stdin (teclado) y stdout (pantalla).
import 'dart:io';

/// Punto de entrada del programa.
///
/// Un programa Dart siempre comienza a ejecutarse por la función [main].
void main() {
  mostrarBienvenida();

  // Bucle infinito: se repite hasta que el usuario elija la opción '0'.
  while (true) {
    final opcion = pedirOpcion();

    // Condición de salida del bucle.
    if (opcion == Opcion.salir) {
      print('\n¡Hasta luego! 👋');
      break; // 'break' rompe el while y termina el programa.
    }

    // Pedimos los dos operandos. Si alguno no es un número válido,
    // reiniciamos la iteración con 'continue'.
    final num1 = pedirNumero('Ingresa el primer número : ');
    if (num1 == null) {
      print('⚠  El valor ingresado no es un número válido.');
      continue;
    }

    final num2 = pedirNumero('Ingresa el segundo número: ');
    if (num2 == null) {
      print('⚠  El valor ingresado no es un número válido.');
      continue;
    }

    // Calculamos y mostramos el resultado. calcular() devuelve 'null'
    // cuando la operación no es posible (por ejemplo, dividir entre 0).
    final resultado = calcular(opcion, num1, num2);
    if (resultado == null) {
      print('⚠  No se puede dividir entre cero.');
      continue;
    }

    print('➡  Resultado: ${formatear(num1)} ${simbolo(opcion)} '
        '${formatear(num2)} = ${formatear(resultado)}\n');
  }
}

// ---------------------------------------------------------------------------
// ENUMERACIÓN DE OPCIONES
// ---------------------------------------------------------------------------

/// Representa cada acción que el usuario puede elegir en el menú.
///
/// Usar un enum evita "números mágicos" (1, 2, 3...) repartidos por el código
/// y hace que el programa sea más fácil de leer y mantener.
enum Opcion { suma, resta, multiplicacion, division, salir }

// ---------------------------------------------------------------------------
// PRESENTACIÓN E INTERACCIÓN POR CONSOLA
// ---------------------------------------------------------------------------

/// Imprime el encabezado y el menú de opciones disponibles.
void mostrarBienvenida() {
  print('=============================');
  print('   CALCULADORA EN DART');
  print('=============================');
  print('1. Suma            (+)');
  print('2. Resta           (-)');
  print('3. Multiplicación  (*)');
  print('4. División        (/)');
  print('0. Salir');
  print('=============================');
}

/// Muestra el menú y espera una opción válida del usuario.
///
/// Se repite hasta recibir una entrada correcta, de modo que el usuario
/// nunca queda en un estado inconsistente.
Opcion pedirOpcion() {
  // Los 'case' agrupados devuelven el enum correspondiente.
  while (true) {
    stdout.write('\nElige una operación (0-4): ');
    final entrada = stdin.readLineSync()?.trim();

    switch (entrada) {
      case '1':
        return Opcion.suma;
      case '2':
        return Opcion.resta;
      case '3':
        return Opcion.multiplicacion;
      case '4':
        return Opcion.division;
      case '0':
        return Opcion.salir;
      default:
        print('⚠  Opción no válida. Intenta de nuevo.');
    }
  }
}

/// Pide un número por consola.
///
/// Devuelve el número convertido a [double] o `null` si la entrada no es
/// numérica (por ejemplo, si el usuario escribe "hola").
/// Acepta tanto punto como coma decimal (1.5 / 1,5).
double? pedirNumero(String mensaje) {
  stdout.write(mensaje);
  final entrada = stdin.readLineSync()?.trim().replaceAll(',', '.');
  return double.tryParse(entrada ?? '');
}

// ---------------------------------------------------------------------------
// LÓGICA DE NEGOCIO (cálculos)
// ---------------------------------------------------------------------------

/// Aplica la [opcion] elegida sobre [a] y [b].
///
/// Devuelve el resultado de la operación o `null` si la operación no está
/// definida (en este caso, la división entre cero).
double? calcular(Opcion opcion, double a, double b) {
  switch (opcion) {
    case Opcion.suma:
      return a + b;
    case Opcion.resta:
      return a - b;
    case Opcion.multiplicacion:
      return a * b;
    case Opcion.division:
      // Protegemos la división: matemáticamente no está definida por 0.
      if (b == 0) return null;
      return a / b;
    case Opcion.salir:
      // Nunca se llega aquí, pero Dart obliga a cubrir todos los casos.
      return null;
  }
}

/// Devuelve el símbolo matemático asociado a una [opcion].
String simbolo(Opcion opcion) {
  switch (opcion) {
    case Opcion.suma:
      return '+';
    case Opcion.resta:
      return '-';
    case Opcion.multiplicacion:
      return '×';
    case Opcion.division:
      return '÷';
    case Opcion.salir:
      return '';
  }
}

/// Da formato a un número para mostrarlo en pantalla.
///
/// Si el número es entero (4.0) lo muestra sin decimales ("4"); en caso
/// contrario conserva sus decimales ("3.5").
String formatear(double numero) {
  if (numero == numero.roundToDouble()) {
    return numero.toInt().toString();
  }
  return numero.toString();
}
