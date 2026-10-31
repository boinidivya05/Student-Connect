import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/exp1/uicomponents.dart';

Widget wrap(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets('GreetingCard shows the name', (tester) async {
    await tester.pumpWidget(wrap(const GreetingCard(name: 'Divya')));
    expect(find.text('Hello, Divya!'), findsOneWidget);
  });

  testWidgets('Counter increments when button is tapped', (tester) async {
    await tester.pumpWidget(wrap(const CounterWidget()));
    expect(find.text('Count: 0'), findsOneWidget);

    await tester.tap(find.text('Increment'));
    await tester.pump();

    expect(find.text('Count: 1'), findsOneWidget);
  });

  testWidgets('Login succeeds with valid input', (tester) async {
    await tester.pumpWidget(wrap(const LoginForm()));
    await tester.enterText(find.byKey(const Key('email')), 'a@b.com');
    await tester.enterText(find.byKey(const Key('password')), '123456');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Login Successful'), findsOneWidget);
  });

  testWidgets('Login fails with invalid input', (tester) async {
    await tester.pumpWidget(wrap(const LoginForm()));
    await tester.enterText(find.byKey(const Key('email')), 'wrong');
    await tester.enterText(find.byKey(const Key('password')), '123');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Invalid email or password'), findsOneWidget);
  });
}
