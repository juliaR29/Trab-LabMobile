import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Teste de fumaça', (WidgetTester tester) async {
    // Verica se o contador começou com zero(0).
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Verica se o contador foi incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
