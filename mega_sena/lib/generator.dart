import 'dart:math';

List<num> generateMegaSenaNumbers() {
  const rangeStart = 1;
  const rangeEnd = 60;
  const length = 6;

  // TODO: add luck
  Set<num> numbers = Set();
  final _random = Random();
  while (numbers.length != length) {
    final num randomNumber = _random.nextInt(rangeEnd - 1) + rangeStart + 1;
    numbers.add(randomNumber);
  }
  final list = numbers.toList();
  list.sort();
  return list;
}
