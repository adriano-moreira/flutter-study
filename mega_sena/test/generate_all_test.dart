class Game {
  final int a;
  final int b;
  final int c;
  final int d;
  final int e;
  final int f;

  Game({
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.e,
    required this.f,
  });

  @override
  String toString() {
    return 'Game{a: $a, b: $b, c: $c, d: $d, e: $e, f: $f}';
  }
}

final list = <Game>[];

addGame({
  required int a,
  required int b,
  required int c,
  required int d,
  required int e,
  required int f,
}) {
  // final Set<int> values = {a, b, c, d, e, f};
  // if (values.length == 6) {
  //   list.add(Game(values.toList()));
  // }

  // list.add(Game(a: a, b: b, c: c, d: d, e: e, f: f));
  print(Game(a: a, b: b, c: c, d: d, e: e, f: f));
}

main() {
  for (var a = 1; a <= 60; a++) {
    for (var b = 1; b <= 60; b++) {
      for (var c = 1; c <= 60; c++) {
        for (var d = 1; d <= 60; d++) {
          for (var e = 1; e <= 60; e++) {
            for (var f = 1; f <= 60; f++) {
              addGame(
                a: a,
                b: b,
                c: c,
                d: d,
                e: e,
                f: f,
              );
            }
          }
        }
      }
    }
  }

  print(list.length);
}
