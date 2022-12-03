import 'dart:io';

String kInputFilePath = "day-03/input.txt";

void main(List<String> args) {
  File inputFile = File.fromUri(Uri(path: kInputFilePath));
  print("Input File as list of Strings");
  List<String> lines = inputFile.readAsLinesSync();
  print(lines);
  lines.forEach((element) {
    assert(element.length.isEven);
  });
  // print(prioritiesHashMap);
  print(commonElementHalved("vJrwpWtwJgWrhcsFMMfFFhFp") == "p");
  print(commonElementHalved("jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL") == "L");
  print(commonElementHalved("PmmdzqPrVvPwwTWBwg") == "P");
  print(commonElementHalved("wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn") == "v");
  print(commonElementHalved("ttgJtRGJQctTZtZT") == "t");
  print(commonElementHalved("CrZsJsPPZsGzwwsLwLmpwMDw") == "s");

  print("Sum of Priorities:");
  print(lines
      .map((e) => prioritiesHashMap[commonElementHalved(e)]!)
      .reduce((value, element) => value += element));

  int totalBadgePriority = 0;
  for (var i = 0; i < lines.length; i += 3) {
    String commonElement = commonElementBetweenStrings([
      lines[i],
      lines[i + 1],
      lines[i + 2],
    ]);
    totalBadgePriority += prioritiesHashMap[commonElement]!;
  }
  print("Sum of Priorities of Badges");
  print(totalBadgePriority);
}

String commonElementHalved(String string) {
  String firstSubstring = string.substring(0, (string.length ~/ 2));
  String secondSubstring = string.substring(string.length ~/ 2, string.length);
  for (var charKey in prioritiesHashMap.keys) {
    if (firstSubstring.contains(charKey) && secondSubstring.contains(charKey))
      return charKey;
  }
  return '';
}

String commonElementBetweenStrings(List<String> strings) {
  for (var charKey in prioritiesHashMap.keys) {
    bool charKeyIsCommon = strings
        .map((e) => e.contains(charKey))
        .reduce((value, element) => value = value && element);
    if (charKeyIsCommon) return charKey;
  }
  return '';
}

Map<String, int> prioritiesHashMap = Map.fromEntries(
  List.generate(
      52,
      (index) => MapEntry(
          String.fromCharCode(index < 26 ? index + 97 : index + 39),
          index + 1)),
);
