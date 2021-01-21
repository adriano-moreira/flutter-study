import 'package:flutter_test/flutter_test.dart';
import 'package:mega_sena/generator.dart';

void main() {
  test('should_have_6_numbers', () {
    final numbers = generateMegaSenaNumbers();
    expect(numbers.length, 6);
  });
}
