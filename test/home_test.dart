import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My widget has a Text Spent', (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: BankInherited(child: const Home())));
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });

  testWidgets('It finds a LinearProgressIndicator', (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: BankInherited(child: const Home())));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('It finds an AccountStatus by key', (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: BankInherited(child: const Home())));
    expect(find.byKey(Key('testKey')), findsOneWidget);
  });

  testWidgets('It finds 5 BoxCards', (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: BankInherited(child: const Home())));
    expect(find.byWidgetPredicate((widget) {
      return (widget is BoxCard);
    }), findsNWidgets(5));
  });

  testWidgets('When tap Deposit button property earned should increase in 10',
      (tester) async {
    await tester
        .pumpWidget(MaterialApp(home: BankInherited(child: const Home())));
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    // It is necessary to 'pump' the tester to 'reresh' the test screen with the actions performed
    await tester.pumpAndSettle();
    expect(find.text('\$10.0'), findsOneWidget);
  });
}
