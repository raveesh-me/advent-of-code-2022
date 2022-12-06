import 'dart:io';

String kInputFilePath = "day-06/input.txt";

int main(List<String> args) {
  File inputFile = File.fromUri(Uri(path: kInputFilePath));
  String input = inputFile.readAsLinesSync()[0];
  for (var i = 3; i < input.length; i++) {
    if ({input[i], input[i - 1], input[i - 2], input[i - 3]}.length == 4) {
      print("start-of-packet: ${i + 1}");
      break;
    }
  }

  for (var i = 13; i < input.length; i++) {
    if (Set.from(List.generate(14, (index) => input[i - index])).length ==
        14) {
      print("start-of-message: ${i + 1}");
      break;
    }
  }
  return 0;
}
