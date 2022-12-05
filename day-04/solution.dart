import 'dart:io';

String kInputFilePath = "day-04/input.txt";

void main(List<String> args) {
  File inputFile = File.fromUri(Uri(path: kInputFilePath));
  List<String> lines = inputFile.readAsLinesSync();
  /*
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
  */
  assert(isEntireSpaceOverlap("2-4,6-8") == false);
  assert(isEntireSpaceOverlap("2-3,4-5") == false);
  assert(isEntireSpaceOverlap("5-7,7-9") == false);
  assert(isEntireSpaceOverlap("2-8,3-7") == true);
  assert(isEntireSpaceOverlap("6-6,4-7") == true);
  assert(isEntireSpaceOverlap("2-6,4-8") == false);
  assert(isEntireSpaceOverlap("2-6,2-6") == true);
  assert(isEntireSpaceOverlap("6-6,4-6") == true);
  int numberOfOverlaps = lines.where(isEntireSpaceOverlap).length;
  print(numberOfOverlaps);
  int numberOfOverlapsAtAll = lines.where(isSpaceOverlapAtAll).length;
  print(numberOfOverlapsAtAll);
}

bool isEntireSpaceOverlap(String line) {
  List<String> elvesSeparated = line.split(',');
  List<int> elfOneLimits = elvesSeparated[0].split('-').map(int.parse).toList();
  List<int> elfTwoLimits = elvesSeparated[1].split('-').map(int.parse).toList();
  List<int> elfOneSpaces = listFromLimits(elfOneLimits[1], elfOneLimits[0]);
  List<int> elfTwoSpaces = listFromLimits(elfTwoLimits[1], elfTwoLimits[0]);
  List<int> biggerArray;
  List<int> smallerArray;
  elfOneSpaces.length >= elfTwoSpaces.length
      ? {biggerArray = elfOneSpaces, smallerArray = elfTwoSpaces}
      : {biggerArray = elfTwoSpaces, smallerArray = elfOneSpaces};
  return smallerArray
      .map(biggerArray.contains)
      .reduce((value, element) => value && element);
}

bool isSpaceOverlapAtAll(String line) {
  List<String> elvesSeparated = line.split(',');
  List<int> elfOneLimits = elvesSeparated[0].split('-').map(int.parse).toList();
  List<int> elfTwoLimits = elvesSeparated[1].split('-').map(int.parse).toList();
  List<int> elfOneSpaces = listFromLimits(elfOneLimits[1], elfOneLimits[0]);
  List<int> elfTwoSpaces = listFromLimits(elfTwoLimits[1], elfTwoLimits[0]);
  Set<int> combinedSpaces = Set.from([...elfOneSpaces, ...elfTwoSpaces]);
  return combinedSpaces.length < elfOneSpaces.length + elfTwoSpaces.length;
}

List<int> listFromLimits(int upperLimit, int lowerLimit) {
  return List.generate(
      upperLimit - lowerLimit + 1, (index) => index + lowerLimit);
}
