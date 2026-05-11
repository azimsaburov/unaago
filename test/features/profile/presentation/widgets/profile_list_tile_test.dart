import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unaago/features/profile/presentation/widgets/profile_list_tile.dart';

void main() {
  testWidgets('ProfileListTile displays correct text for each field', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProfileListTile(
            leading: 'L',
            title: 'T',
            subtitle: 'S',
            trailing: 'TR',
          ),
        ),
      ),
    );

    expect(find.text('L'), findsOneWidget);
    expect(find.text('T'), findsOneWidget);
    expect(find.text('S'), findsOneWidget);
    expect(find.text('TR'), findsOneWidget);
  });
}
