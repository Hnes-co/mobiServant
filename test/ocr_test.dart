import 'package:flutter_test/flutter_test.dart';
import 'package:mobi_servant/ocr_class.dart';

void main() {
  testWidgets('Test if the OCR component works', (WidgetTester tester) async {
    OcrClass ocr = OcrClass(fontSize: 20.0);
    expect(ocr.fontSize, 20.0);
  });
}
