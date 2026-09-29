import 'package:flutter_test/flutter_test.dart';
import 'package:home_screen/main.dart';

void main() {
  testWidgets('static home screen builds', (tester) async {
    await tester.pumpWidget(const LastMinuteDealApp());
    expect(find.text('20 hotels Available'), findsOneWidget);
    expect(find.text('Hotel Horizon Lonavala'), findsOneWidget);
  });
}
