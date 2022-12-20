import 'dart:math';
/*enum Result{
  correct,tooHigh,tooLow
}*/
class Game {
  int answer = 0;
  //count private
  int _count = 0;

  Game(int maxRandom) {
    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
    //print(answer);
  }
  int doGuess(int guess) {
    _count++;
    if (guess == answer) {
      print('║ ➜ $guess CORRECT 🚀 Total GUESSES : $total');
      print('║───────────────────────────────────────');
      print('║                 END                     ');
      print('╚═══════════════════════════════════════');
      return 1; //correct
    }
    else if (guess > answer) {
      print('║ ➜ $guess is TOO HIGH ! ▲');
      print('║───────────────────────────────────────');
      return 0; //tooHigh
    }
    else {
      print('║ ➜ $guess is TOO LOW ! ▼');
      print('║───────────────────────────────────────');
      return 0; //tooLow
    }
  }
  //get count to use
  int get total {
    return _count;
  }
}
