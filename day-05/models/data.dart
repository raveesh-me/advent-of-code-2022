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

import 'dart:async';

class Data {
  List<List<String>> columns = List.generate(9, (_) => <String>[]);
  Data(List<String> dataStrings) : assert(dataStrings.length == 9) {
    dataStrings.forEach((element) {
      for (var i = 0; i < element.length; i++) {
        if (upperCaseAlphabets.contains(element[i])) {
          columns[int.parse(dataStrings[8][i]) - 1].add(element[i]);
        }
      }
    });
    columns = columns.map((e) => e.reversed.toList()).toList();
  }

  moveMultiAtOnce({required int howMany, required int from, required int to}) {
    columns[to - 1].addAll((columns[from - 1].sublist(
        columns[from - 1].length - howMany, columns[from - 1].length)));
    columns[from - 1].removeRange(
        columns[from - 1].length - howMany, columns[from - 1].length);
  }

  move({required int howMany, required int from, required int to}) {
    while (howMany > 0) {
      columns[to - 1].add((columns[from - 1].removeLast()));
      howMany--;
    }
  }

  printPretty() {
    for (var i = 0; i < columns.length; i++) {
      print("${i + 1} : ${columns[i].toString()}");
    }
  }

  printLast() {
    print(String.fromCharCodes(columns.map((e) => e.last.codeUnitAt(0))));
  }
}

List<String> upperCaseAlphabets =
    List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));
