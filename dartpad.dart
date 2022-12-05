int main(List<String> args) {
  List list = [1, 2, 3, 4, 5, 6];
  list.removeRange(list.length - 3, list.length);
  print(list);
  return 0;
}
