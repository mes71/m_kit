import 'package:flutter_test/flutter_test.dart';
import 'package:m_kit/src/utils/logger/logger.dart';

void main() {
  test('log', () {
    MLogger.log(
        'Lorem ipsum dolor sit amet consecteoooooolldidunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet consecteoooooolldidunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet consecteoooooolldidunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet consecteoooooolldidunt ut labore et dolore magna aliqua');
  });

  test('log', () {
    MLogger.log(
        'Lorem ipsum dolora Lorem ipsum dolor sit amet consecteoooooolldiduua');
  });
}
