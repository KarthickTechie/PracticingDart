import 'dart:io';
void main() {
  stdout.write('Enter your Name: ');
  String? name = stdin.readLineSync();
  stdout.write('Enter your Age: ');
  String? age = stdin.readLineSync();
  int age_int = int.parse(age!);
  print('$name');
  print(age_int+10);
}
