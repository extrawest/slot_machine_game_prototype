import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:slot_machine_game/consts.dart';
import 'package:slot_machine_game/main.dart' as app;
import 'package:slot_machine_game/widgets/home_screen/slot_game_main_menu.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  defineIntegrationTest();
}

void defineIntegrationTest() {
  testWidgets('app launch', (tester) async {
    app.main();

    await tester.pump(const Duration(seconds: 15));
    await tester.pumpAndSettle();

    final playButton = find.byKey(const ValueKey(playButtonKeyValue));
    expect(playButton, findsOneWidget);
    await tester.tap(playButton);

    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(startMachineButtonKeyValue)));
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(stopFirstSlotButtonKeyValue)));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(stopSecondSlotButtonKeyValue)));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(stopThirdSlotButtonKeyValue)));
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(backButtonKeyValue)));
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
  });
}
