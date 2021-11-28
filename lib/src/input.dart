import 'dart:convert';
import 'dart:io';

import 'file_helper.dart';

// read line from stdio or provided file
String? input({
  RandomAccessFile? file,
  Encoding encoding = systemEncoding,
  bool retainNewlines = false,
}) {
  if (file == null) {
    return stdin.readLineSync(
        encoding: encoding, retainNewlines: retainNewlines);
  }
  return readLineSync(file);
}
