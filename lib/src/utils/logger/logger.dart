import 'package:flutter/foundation.dart';

import 'console_color.dart';

class MLogger {
  static void log(String message) {
    if (kDebugMode) {
      debugPrint(_buildMessage(message, ConsoleColor.cyan));
      debugPrint("log: $message");
    }
  }

  static String _buildMessage(String message, ConsoleColor color) {
    StringBuffer buffer = StringBuffer();
    buffer.writeln(
        '${color.code}╔═${List.generate(85, (index) => '═').join()}══╗${color.code}');
    buffer.write(_buildLine(message, color));
    buffer.writeln(
        '${color.code}╚═${List.generate(85, (index) => '═').join()}══╝${color.code}');
    return buffer.toString();
  }

  static String _buildLine(String message, ConsoleColor color) {
    StringBuffer buffer = StringBuffer();
    for (var i = 0; i <= message.length; i += 80) {
      String mainLine = message.substring(
          i, i + 80 > message.length ? message.length : i + 80);
      String padding =
          List.generate(87 - mainLine.length, (index) => ' ').join();
      buffer.writeln('${color.code}║ $mainLine$padding║${color.code}');
    }
    return buffer.toString();
  }
}
