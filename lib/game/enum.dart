const assetPath = 'assets/images';

// enum을 이렇게 사용 할 수가 있구나...
enum InputType {
  rock,
  scissors,
  paper;

  String get path => '$assetPath/$name.png';
}
