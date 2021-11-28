import 'dart:io';
import 'package:easy_input/easy_input.dart';

void main() async {
  var line = input();
  print('line: $line');

  final file = await aopen('kek.txt', mode: FileMode.write);
  file.writeStringSync('kek1\n');
  file.writeStringSync('kek2\n');
  await file.close();

  final file2 = open('kek.txt');
  print('line1: ${input(file: file2)}'); // kek1
  print('line1: ${input(file: file2)}'); // kek2
  file2.close();
}
