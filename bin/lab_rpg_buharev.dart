import 'dart:io';

import 'package:lab_rpg_buharev/battle.dart';
import 'package:lab_rpg_buharev/character.dart';
import 'package:lab_rpg_buharev/characters.dart';

void printClasses() {
  print('');
  print('Выберите класс персонажа:');
  print('1 - ${Warrior(name: 'preview')}');
  print('1 - ${Mage(name: 'preview')}');
  print('1 - ${Archer(name: 'preview')}');
}

Character selectCharacter(String prompt) {
  stdout.write(
    '$prompt - введите имя персонажа: ',
  );
  String? name = stdin.readLineSync();
  name = (name == null || name.trim().isEmpty)
      ? 'Герой'
      : name.trim();
  printClasses();
  while (true) {
    stdout.write('Выберите класс (1/2/3): ');
    String? choice = stdin.readLineSync();
    switch (choice?.trim()) {
      case '1':
        return Warrior(name: name);
      case '2':
        return Mage(name: name);
      case '3':
        return Archer(name: name);
      default:
        print(
          'Неверный выбор. Введите 1,2 или 3.',
        );
    }
  }
}

void main() {
  print(' RPG Битва ');
  Character player = selectCharacter("игрок");
  Character enemy = selectCharacter("противник");
  battle(player, enemy);
  stdout.write('Сыграть ещё раз? (да/нет):');
  String? again = stdin.readLineSync();
  if (again?.trim().toLowerCase() == 'да') {
    main();
  } else {
    print('спасибо за игру!');
  }
}
