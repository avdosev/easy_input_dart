import 'dart:convert';
import 'dart:io';

String? readLineSync(
  RandomAccessFile file, {
  Encoding encoding = systemEncoding,
  bool retainNewlines = false,
}) {
  const CR = 13;
  const LF = 10;
  final List<int> line = <int>[];
  // On Windows, if lineMode is disabled, only CR is received.
  bool crIsNewline = Platform.isWindows;
  if (retainNewlines) {
    int byte;
    do {
      byte = file.readByteSync();
      if (byte < 0) {
        break;
      }
      line.add(byte);
    } while (byte != LF && !(byte == CR && crIsNewline));
    if (line.isEmpty) {
      return null;
    }
  } else if (crIsNewline) {
    // CR and LF are both line terminators, neither is retained.
    while (true) {
      int byte = file.readByteSync();
      if (byte < 0) {
        if (line.isEmpty) return null;
        break;
      }
      if (byte == LF || byte == CR) break;
      line.add(byte);
    }
  } else {
    // Case having to handle CR LF as a single unretained line terminator.
    outer:
    while (true) {
      int byte = file.readByteSync();
      if (byte == LF) break;
      if (byte == CR) {
        do {
          byte = file.readByteSync();
          if (byte == LF) break outer;

          line.add(CR);
        } while (byte == CR);
        // Fall through and handle non-CR character.
      }
      if (byte < 0) {
        if (line.isEmpty) return null;
        break;
      }
      line.add(byte);
    }
  }
  return encoding.decode(line);
}
