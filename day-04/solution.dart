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
  assert(isLineOverlap("2-4,6-8") == false);
  assert(isLineOverlap("2-3,4-5") == false);
  assert(isLineOverlap("5-7,7-9") == false);
  assert(isLineOverlap("2-8,3-7") == true);
  assert(isLineOverlap("6-6,4-7") == true);
  assert(isLineOverlap("2-6,4-8") == false);
  assert(isLineOverlap("2-6,2-6") == true);
  assert(isLineOverlap("6-6,4-6") == true);
  int numberOfOverlaps = lines.where(isLineOverlap).length;
  print(numberOfOverlaps);
}

bool isLineOverlap(String line) {
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

  // print(elfTwoLimits);
  // return (elfOneLimits[0] >= elfTwoLimits[0])
  //     ? elfOneLimits[1] <= elfTwoLimits[1]
  //     : elfOneLimits[1] >= elfTwoLimits[1];
}

List<int> listFromLimits(int upperLimit, int lowerLimit) {
  return List.generate(
      upperLimit - lowerLimit + 1, (index) => index + lowerLimit);
}
