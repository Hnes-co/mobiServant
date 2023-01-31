import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobi_servant/main.dart';

void main() {
  testWidgets('Test if the app builds', (WidgetTester tester) async {
    const mobiServant = Mobiservant(key: Key('test'));
    expect(mobiServant.key, const Key('test'));
  });
}
