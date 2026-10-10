// Test básico para verificar que la app arranca correctamente.
import 'package:flutter_test/flutter_test.dart';

import 'package:actividad4_pinpon_flame/main.dart';

void main() {
  testWidgets('La app muestra el menú inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const MiApp());
    await tester.pumpAndSettle();

    expect(find.text('PING PONG'), findsOneWidget);
    expect(find.text('FLAME EDITION'), findsOneWidget);
    expect(find.text('JUGAR'), findsOneWidget);
  });
}
