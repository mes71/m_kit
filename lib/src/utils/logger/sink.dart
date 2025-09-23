import 'dart:io';

import 'package:flutter/foundation.dart';

/// Base sink interface
abstract class LogSink {
  void write(String message);
}

/// Console sink
class ConsoleSink implements LogSink {
  @override
  void write(String message) => debugPrint(message);
}

/// File sink
class FileSink implements LogSink {
  final IOSink _sink;
  FileSink(String path) : _sink = File(path).openWrite(mode: FileMode.append);

  @override
  void write(String message) => _sink.writeln(message);

  Future<void> dispose() async {
    await _sink.flush();
    await _sink.close();
  }
}