import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_todo_app/main.dart';

void main() {
  testWidgets('App shows empty state message', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());

    expect(find.text('To-Do'), findsOneWidget);
    expect(find.text('No tasks yet.\nAdd one above!'), findsOneWidget);
  });

  testWidgets('Can add a task', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());

    await tester.enterText(find.byType(TextField), 'Buy groceries');
    await tester.tap(find.text('Add'));
    await tester.pump();

    expect(find.text('Buy groceries'), findsOneWidget);
    expect(find.text('No tasks yet.\nAdd one above!'), findsNothing);
  });

  testWidgets('Can mark a task as done', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());

    await tester.enterText(find.byType(TextField), 'Read a book');
    await tester.tap(find.text('Add'));
    await tester.pump();

    final checkbox = find.byType(Checkbox);
    expect(tester.widget<Checkbox>(checkbox).value, isFalse);

    await tester.tap(checkbox);
    await tester.pump();

    expect(tester.widget<Checkbox>(checkbox).value, isTrue);
  });

  testWidgets('Can delete a task', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());

    await tester.enterText(find.byType(TextField), 'Walk the dog');
    await tester.tap(find.text('Add'));
    await tester.pump();

    expect(find.text('Walk the dog'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Walk the dog'), findsNothing);
    expect(find.text('No tasks yet.\nAdd one above!'), findsOneWidget);
  });

  testWidgets('Empty input does not add a task', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());

    await tester.tap(find.text('Add'));
    await tester.pump();

    expect(find.text('No tasks yet.\nAdd one above!'), findsOneWidget);
  });
}
