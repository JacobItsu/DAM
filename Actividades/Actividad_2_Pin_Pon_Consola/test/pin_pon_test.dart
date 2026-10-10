// ---------------------------------------------------------------------------
// PRUEBAS UNITARIAS DE LA LÓGICA DEL JUEGO
// ---------------------------------------------------------------------------
// Se prueba la lógica "pura" (movimiento y colisiones) sin depender de la
// consola ni del teclado, de modo que los tests son rápidos y deterministas.
//
// Ejecutar con:  dart test
// ---------------------------------------------------------------------------

import 'package:pin_pon/entities.dart';
import 'package:test/test.dart';

void main() {
  group('Pelota', () {
    test('se mueve según su dirección (dx, dy)', () {
      final pelota = Pelota(x: 5, y: 5);
      pelota.mover();
      expect(pelota.x, 6);
      expect(pelota.y, 6);
    });

    test('rebotarY invierte la dirección vertical', () {
      final pelota = Pelota(x: 0, y: 0, dy: 1);
      pelota.rebotarY();
      expect(pelota.dy, -1);
    });

    test('rebotarX invierte la dirección horizontal', () {
      final pelota = Pelota(x: 0, y: 0, dx: 1);
      pelota.rebotarX();
      expect(pelota.dx, -1);
    });

    test('reiniciar la coloca en el centro y cambia de lado', () {
      final pelota = Pelota(x: 0, y: 0, dx: 1);
      pelota.reiniciar(20, 10);
      expect(pelota.x, 20);
      expect(pelota.y, 10);
      expect(pelota.dx, -1); // Sale hacia el lado contrario al que anotó.
    });
  });

  group('Paleta', () {
    test('sube pero no se sale por arriba', () {
      final paleta = Paleta(x: 2, y: 1, alto: 4);
      paleta.moverArriba();
      expect(paleta.y, 1); // El límite superior es y = 1.
    });

    test('baja pero no se sale por abajo', () {
      final paleta = Paleta(x: 2, y: 10, alto: 4);
      // límite inferior 20 => el borde superior máximo es 15.
      for (var i = 0; i < 20; i++) {
        paleta.moverAbajo(20);
      }
      expect(paleta.y, 15);
      expect(paleta.y + paleta.alto, lessThan(20));
    });

    test('la IA se mueve hacia la bola', () {
      final paleta = Paleta(x: 2, y: 5, alto: 4);
      // La bola está por debajo => la paleta debe bajar.
      paleta.moverIA(15, 20);
      expect(paleta.y, 6);
    });
  });

  group('Marcador', () {
    test('empieza en cero', () {
      final marcador = Marcador();
      expect(marcador.jugador1, 0);
      expect(marcador.jugador2, 0);
    });
  });
}
