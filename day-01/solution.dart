import 'dart:io';

void main(List<String> args) {
  File inputFile = File.fromUri(Uri(path: 'day-01/input.txt'));
  List<String> lines = inputFile.readAsLinesSync();
  print(lines);
  List<int> energies = <int>[];
  energies.add(0);
  for (String energy in lines) {
    if (energy.trim() == '') {
      energies.add(0);
      print("Next Elf");
    } else {
      print(energy);
      energies.last += int.parse(energy.trim());
    }
  }
  energies.sort();
  print("ANSWER TO PART 1");
  print(energies.last);
  print("ANSWER TO PART 2");
  int length = energies.length;
  print((energies[length - 1] + energies[length - 2] + energies[length - 3])
      .toString());
}
