import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final MockBankHttp httpMock = MockBankHttp();

  testWidgets('My widget has a Text Spent', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: Home(
      api: httpMock.dolarToReal(),
    ))));
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });

  testWidgets('It finds a LinearProgressIndicator', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: Home(
      api: httpMock.dolarToReal(),
    ))));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('It finds an AccountStatus by key', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: Home(
      api: httpMock.dolarToReal(),
    ))));
    expect(find.byKey(Key('testKey')), findsOneWidget);
  });

  testWidgets('It finds 5 BoxCards', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: Home(
      api: httpMock.dolarToReal(),
    ))));
    expect(find.byWidgetPredicate((widget) {
      return (widget is BoxCard);
    }), findsNWidgets(5));
  });

  testWidgets('When tap Deposit button property earned should increase in 10',
      (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: Home(
      api: httpMock.dolarToReal(),
    ))));
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    // It is necessary to 'pump' the tester to 'reresh' the test screen with the actions performed
    await tester.pumpAndSettle();
    expect(find.text('\$10.0'), findsOneWidget);
  });

  testWidgets('Testing MockBankHttp dolarToReal', (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: Home(
      api: httpMock.dolarToReal(),
    ))));
    verify(httpMock.dolarToReal()).called(1);
  });
}
