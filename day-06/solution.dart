import 'dart:io';

String kInputFilePath = "day-06/input.txt";

int main(List<String> args) {
  File inputFile = File.fromUri(Uri(path: kInputFilePath));
  List<String> lines = inputFile.readAsLinesSync();
  lines.forEach(print);
  return 0;
}
