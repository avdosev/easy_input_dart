import 'dart:convert';
import 'dart:io';

import 'file_helper.dart';

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
