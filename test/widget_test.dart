// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task_manager_app/main.dart';

void main() {
  testWidgets('Task Manager app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TaskManagerApp());

    // Verify that the app title is present
    expect(find.text('Task Manager'), findsOneWidget);
    expect(find.text('Новая задача'), findsOneWidget);
    expect(find.text('Добавить'), findsOneWidget);
  });

  testWidgets('Add a new task', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskManagerApp());

    // Enter text in the text field
    await tester.enterText(find.byType(TextField), 'Test task');
    await tester.tap(find.text('Добавить'));
    await tester.pump();

    // Verify that the task appears in the list
    expect(find.text('Test task'), findsOneWidget);
  });

  testWidgets('Delete a task', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskManagerApp());

    // Add a task first
    await tester.enterText(find.byType(TextField), 'Task to delete');
    await tester.tap(find.text('Добавить'));
    await tester.pump();

    // Verify task is present
    expect(find.text('Task to delete'), findsOneWidget);

    // Tap delete button (first delete icon in the list)
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    // Verify task is removed
    expect(find.text('Task to delete'), findsNothing);
  });
}
