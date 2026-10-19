import 'dart:math';

abstract class Character {
  final String name;
  int attack();
  int hp;
  final int maxHp;
  final Random _random = Random();

  void describe() {
    print('$name $hpBar');
  }
  void takeDamage(int damage) {
    hp -= damage;
    if (hp < 0) hp = 0;
  }
  bool get isAlive => hp > 0;
  String get hpBar {
    int filled = (hp / maxHp * 10).round();
    int empty = 10 - filled;
    return '[${'█' * filled}${ '░' * empty}] $hp/maxHp';
  }
  @override
  String toString();
  Character({
    required this.name,
    required this.hp,
  }) : maxHp = hp;
}