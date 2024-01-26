const assetPath = 'assets/images';

// enum을 이렇게 사용 할 수가 있구나...
enum InputType {
  rock,
  scissors,
  paper;

  String get path => '$assetPath/$name.png';
}

enum Result {
  playerWin('player 승리'),
  draw('무승부'),
  cpuWin('player 패배');

  const Result(this.displayString);

  final String displayString;
}
