# Easy input

A simple Python-style package for working with stdin and files.

## Links

[Pub dev][pubdev]

[Documentation][docs]

[Issue tracker][tracker]

## Usage

```dart
import 'dart:io';
import 'package:easy_input/easy_input.dart';

void main() async {
  var line = input();
  print('line: $line');

  final file = open('kek.txt', mode: FileMode.write);
  file.writeStringSync('kek1\n');
  file.writeStringSync('kek2\n');
  await file.close();

  final file2 = open('kek.txt');
  print('line1: ${input(file: file2)}'); // kek1
  print('line1: ${input(file: file2)}'); // kek2
  file2.close();
}

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/avdosev/itertools_dart/issues
[pubdev]: https://pub.dev/packages/itertools
[docs]: https://pub.dev/documentation/itertools/latest/
