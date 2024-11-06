import 'package:flutter_test/flutter_test.dart';
import 'package:m_kit/src/utils/logger/console_color.dart';

void main() {
  test('ConsoleColor values should return correct ANSI codes', () {
    expect(ConsoleColor.black.getColor(), '\x1B[30m');
    expect(ConsoleColor.red.getColor(), '\x1B[31m');
    expect(ConsoleColor.green.getColor(), '\x1B[32m');
    expect(ConsoleColor.yellow.getColor(), '\x1B[33m');
    expect(ConsoleColor.blue.getColor(), '\x1B[34m');
    expect(ConsoleColor.magenta.getColor(), '\x1B[35m');
    expect(ConsoleColor.cyan.getColor(), '\x1B[36m');
    expect(ConsoleColor.white.getColor(), '\x1B[37m');
    expect(ConsoleColor.reset.getColor(), '\x1B[0m');
  });
}
