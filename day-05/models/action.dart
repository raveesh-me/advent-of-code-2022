class Action {
  List<int> actionNumbers;
  int get moveHowMany => actionNumbers[0];
  int get fromColumn => actionNumbers[1];
  int get toColumn => actionNumbers[2];

  Action(String actionLine)
      : actionNumbers = actionLine
            .replaceAll("move", "")
            .replaceAll("from", '|')
            .replaceAll('to', '|')
            .trim()
            .split('|')
            .map((e) => int.parse(e.trim()))
            .toList() {}
  Action call(String actionLine) => Action(actionLine);
}
