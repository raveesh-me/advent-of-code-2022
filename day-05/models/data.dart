/*
[Q] [J]                         [H]
[G] [S] [Q]     [Z]             [P]
[P] [F] [M]     [F]     [F]     [S]
[R] [R] [P] [F] [V]     [D]     [L]
[L] [W] [W] [D] [W] [S] [V]     [G]
[C] [H] [H] [T] [D] [L] [M] [B] [B]
[T] [Q] [B] [S] [L] [C] [B] [J] [N]
[F] [N] [F] [V] [Q] [Z] [Z] [T] [Q]
 1   2   3   4   5   6   7   8   9 
*/

class Data {
  List<List<String>> columns = List.generate(9, (_) => <String>[]);
  Data(List<String> dataStrings) : assert(dataStrings.length == 9) {
    dataStrings.forEach((element) {
      for (var i = 0; i < element.length; i++) {
        if (upperCaseAlphabets.contains(element[i])) {
          columns[int.parse(dataStrings[8][i]) -1 ].add(element[i]);
        }
      }
    });
    columns.forEach(print);
  }
}

List<String> upperCaseAlphabets =
    List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));
