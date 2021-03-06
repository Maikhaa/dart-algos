String findAndReplace(String string, List indexes, List sources, List targets) {
  Map sourcesMap = {};
  Map targetsMap = {};
  Map stringMap = {};

  for (int i = 0; i < indexes.length; i++) {
    sourcesMap[indexes[i]] = sources[i];
  }

  for (int i = 0; i < indexes.length; i++) {
    targetsMap[indexes[i]] = targets[i];
  }

  for (int i = 0; i < string.length; i++) {
    stringMap[i] = string[i];

    if (indexes.contains(i)) {
      stringMap[i] = string.substring(i, i + sourcesMap[i].length);
      i += stringMap[i].length - 1;
    }
  }

  for (int key in sourcesMap.keys) {
    if (stringMap[key] == sourcesMap[key]) {
      stringMap[key] = targetsMap[key];
    }
  }

  return stringMap.values.join();
}

void main() {
  print(findAndReplace("abcd", [0, 2], ["ab", "ec"], ["eee", "ffff"]));
  print(findAndReplace("abcd", [0, 2], ["a", "cd"], ["eee", "ffff"]));
}
