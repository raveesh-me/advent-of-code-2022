import 'dart:io';

import 'models/action.dart';
import 'models/data.dart';

String kInputFilePath = "day-05/input.txt";

int main(List<String> args) {
  File inputFile = File.fromUri(Uri(path: kInputFilePath));
  List<String> lines = inputFile.readAsLinesSync();

  Data data = Data(lines.sublist(0, 9));

  List<Action> actions =
      lines.sublist(10, lines.length).map(((e) => Action(e))).toList();
  return 0;
}
