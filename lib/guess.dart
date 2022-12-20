import 'dart:io';
import 'random.dart';

void main() {
  var maxNumber;
  int check = 0;
  int count = 0;
  List<int> myList = [];
  while (check == 0) {
    int result = 0;
    stdout.write('Enter the maximum number to random ➜ ');
    var max = stdin.readLineSync();
    maxNumber = int.tryParse(max!);
    maxNumber ??= 100;
    var game = Game(maxNumber);
    print('╔═══════════════════════════════════════');
    print('║            GUESS THE NUMBER          ');
    print('║───────────────────────────────────────');
    do {
      stdout.write('║ Please guess the between 1 and $maxNumber:');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);
      if (guess == null) {
        continue;
      }
      if (guess > maxNumber) {
        continue;
      }
      if (guess < 1) {
        continue;
      }
      result = game.doGuess(guess);
      if (result == 1) {
        check = 1;
      }
    }
    while (result!= 1);
    myList.add(game.total);
    count = myList.length;
    stdout.write(" ↺ Play again (Y/N) ➜ ");
    for (;;) {
      var playagin = stdin.readLineSync();
      if (playagin == "Y" || playagin == "y") {
        check = 0;
        break;
      }
      else if (playagin == "N" || playagin == "n") {
        print(" You've played $count games");
        for (int i = 0; i < myList.length; i++) {
          int n = myList[i];
          int j = i + 1;
          print(" 🎮 Game $j: $n guesses");
        }
        break;
      }
      else {
        stdout.write(" ↺ Play again (Y/N) ➜ ");
        continue;
      }
    }
  }
}