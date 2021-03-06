List twoSum(List list, int target) {
  if (list == null || target == null || list.isEmpty) return [];

  var map = {};
  var result = [];

  for (int number in list) {
    if (map.containsKey(number)) {
      result.add(map[number]);
      result.add(list.indexOf(number));
    } else {
      map[target - number] = list.indexOf(number);
    }
  }

  return result;
}

main() {
  print(twoSum([1, 2, 4, 8], 6));
}
