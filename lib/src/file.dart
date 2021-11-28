import 'dart:io';

// open file
RandomAccessFile open(String path, {FileMode mode = FileMode.read}) {
  return File(path).openSync(mode: mode);
}

// async open file
Future<RandomAccessFile> aopen(String path, {FileMode mode = FileMode.read}) {
  return File(path).open(mode: mode);
}
