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
}
