void main() {
  var input = stdin.readLineSync().split(' ').map((e) => int.parse(e));
  var eggs = List.generate(20, (_) => 0);
  var touching = List.generate(20, (_) => List.generate(20, (_) => 0));

  for (var i = 0; i < 20; i++) {
    var line = stdin.readLineSync().split(' ');
    var eggIndex = int.parse(line[0]);
    var neighbors = line.skip(1).map((e) => int.parse(e));
    neighbors.add(eggIndex);
    touching[eggIndex].addAll(neighbors);
  }

  var ans = List.empty();
  for (var i = 0; i < 20; i++) {
    var changed = false;
    for (var j = 0; j < 20; j++) {
      if (eggs[j] == 1 && touching[i][j] == 1) {
        eggs[j] = 0;
        changed = true;
      }
    }
    if (!changed) {
      ans.add(i);
    }
  }

  for (var i = 0; i < ans.length; i++) {
    print(ans[i]);
  }
}
