import 'dart:io';

String kInputFilePath = "day-02/input.txt";

void main(List<String> args) {
  File inputFile = File.fromUri(Uri(path: kInputFilePath));
  print("Input File as list of Strings");
  List<String> lines = inputFile.readAsLinesSync();
  print(lines);
  print("First Strategy final score is here");
  print(lines
      .map((e) => scoreMapForFirstPart[e]!)
      .reduce((value, element) => value += element));
  print("Second Strategy final score is here");
  print(lines
      .map((e) => scoreMapForSecondPart[e]!)
      .reduce((value, element) => value += element));
}

const Map<String, int> scoreMapForFirstPart = {
  "A X": 3 + 1, // rock vs rock
  "A Y": 6 + 2, // rock vs paper
  "A Z": 0 + 3, // rock vs scissor
  "B X": 0 + 1, // paper vs Rock
  "B Y": 3 + 2, // paper vs paper
  "B Z": 6 + 3, // paper vs scissor
  "C X": 6 + 1, // scissor vs rock
  "C Y": 0 + 2, // scissor vs paper
  "C Z": 3 + 3, // scissor vs scissor
};

// X Loss
// Y draw
// Z win
const Map<String, int> scoreMapForSecondPart = {
  "A X": 0 + 3, // rock & loss = scissor
  "A Y": 3 + 1, // rock & draw = rock
  "A Z": 6 + 2, // rock & win = paper
  "B X": 0 + 1, // paper & loss = rock
  "B Y": 3 + 2, // paper & draw = paper
  "B Z": 6 + 3, // paper & win = scissor
  "C X": 0 + 2, // scissor & loss = paper
  "C Y": 3 + 3, // scissor & draw = scissor
  "C Z": 6 + 1, // scissor & win = rock
};
