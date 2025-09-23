import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'constant.dart';
import 'sink.dart';

class MLogger {
  static LogLevel _minLevel = LogLevel.debug;
  static bool _enableTimestamp = true;
  static bool _enableColors = true;
  static String _tag = 'APP';
  static int _maxWidth = 85;

  static final List<LogSink> _sinks = [ConsoleSink()];

  /// Configure logger settings
  static void configure({
    LogLevel minLevel = LogLevel.debug,
    bool enableTimestamp = true,
    bool enableColors = true,
    String tag = 'APP',
    List<LogSink>? sinks,
    int maxWidth = 100,
  }) {
    _minLevel = minLevel;
    _enableTimestamp = enableTimestamp;
    _enableColors = enableColors;
    _tag = tag;
    _maxWidth = maxWidth;
    if (sinks != null && sinks.isNotEmpty) {
      _sinks
        ..clear()
        ..addAll(sinks);
    }
  }

  // Convenience methods
  static void d(String message, [String? tag]) =>
      _log(message, LogLevel.debug, tag);

  static void i(String message, [String? tag]) =>
      _log(message, LogLevel.info, tag);

  static void w(String message, [String? tag]) =>
      _log(message, LogLevel.warning, tag);

  static void e(
    String message, [
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  ]) {
    String fullMessage = message;
    if (error != null) fullMessage += '\nError: $error';
    if (stackTrace != null) fullMessage += '\nStackTrace:\n$stackTrace';
    _log(fullMessage, LogLevel.error, tag);
  }

  static void v(String message, [String? tag]) =>
      _log(message, LogLevel.verbose, tag);

  /// Pretty print JSON / Map
  static void json(
    Object? obj, [
    String? label,
    LogLevel level = LogLevel.debug,
  ]) {
    try {
      final pretty = const JsonEncoder.withIndent('  ').convert(obj);
      object(pretty, label, level);
    } catch (_) {
      object(obj, label, level);
    }
  }

  /// Log object
  static void object(
    Object? obj, [
    String? label,
    LogLevel level = LogLevel.debug,
  ]) {
    final message = label != null ? '$label: $obj' : obj.toString();
    _log(message, level);
  }

  /// Divider
  static void divider([String? text, LogLevel level = LogLevel.debug]) {
    final message = text != null
        ? '═══ $text ═══'
        : '═══════════════════════════════';
    _log(message, level);
  }

  static void _log(String message, LogLevel level, [String? tag]) {
    if (!_shouldLog(level)) return;

    final color = _getColorForLevel(level);
    final levelStr = _getLevelString(level);
    final timestamp = _enableTimestamp ? _getTimestamp() : '';
    final tagStr = tag ?? _tag;

    final header = '$timestamp[$tagStr] $levelStr';
    final formattedMessage = _buildMessage(
      message,
      color,
      header,
      maxWidth: _maxWidth,
    );

    for (final sink in _sinks) {
      sink.write(formattedMessage);
    }
  }

  static bool _shouldLog(LogLevel level) {
    if (level == LogLevel.error) return true; // همیشه لاگ error
    if (!kDebugMode) return false;
    return level.index >= _minLevel.index;
  }

  static ConsoleColor _getColorForLevel(LogLevel level) {
    if (!_enableColors) return ConsoleColor.reset;
    switch (level) {
      case LogLevel.debug:
        return ConsoleColor.cyan;
      case LogLevel.info:
        return ConsoleColor.green;
      case LogLevel.warning:
        return ConsoleColor.yellow;
      case LogLevel.error:
        return ConsoleColor.red;
      case LogLevel.verbose:
        return ConsoleColor.gray;
    }
  }

  static String _getLevelString(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 'DEBUG';
      case LogLevel.info:
        return 'INFO ';
      case LogLevel.warning:
        return 'WARN ';
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.verbose:
        return 'VERB ';
    }
  }

  static String _getTimestamp() {
    final now = DateTime.now();
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');
    final s = now.second.toString().padLeft(2, '0');
    final ms = now.millisecond.toString().padLeft(3, '0');
    return "$h:$m:$s.$ms ";
  }

  static String _buildMessage(
    String message,
    ConsoleColor color,
    String header, {
    int maxWidth = 85,
  }) {
    final lines = <String>[];

    for (final line in message.split('\n')) {
      for (var i = 0; i < line.length; i += maxWidth) {
        lines.add(
          line.substring(
            i,
            i + maxWidth > line.length ? line.length : i + maxWidth,
          ),
        );
      }
      if (line.isEmpty) lines.add('');
    }

    // پیدا کردن طول بلندترین خط
    final contentWidth = lines.fold<int>(
      header.length,
      (prev, line) => line.length > prev ? line.length : prev,
    );

    final width = contentWidth + 2; // +2 فاصله قبل و بعد متن
    final buffer = StringBuffer();

    // Top border
    buffer.writeln(
      '${color.code}╔═${List.generate(width, (_) => '═').join()}═╗${ConsoleColor.reset.code}',
    );

    // Header
    buffer.writeln(
      '${color.code}║ $header${' ' * (width - header.length)}║${ConsoleColor.reset.code}',
    );
    buffer.writeln(
      '${color.code}╠═${List.generate(width, (_) => '═').join()}═╣${ConsoleColor.reset.code}',
    );

    // Content
    for (final line in lines) {
      buffer.writeln(
        '${color.code}║ $line${' ' * (width - line.length)}║${ConsoleColor.reset.code}',
      );
    }

    // Bottom border
    buffer.writeln(
      '${color.code}╚═${List.generate(width, (_) => '═').join()}═╝${ConsoleColor.reset.code}',
    );

    return buffer.toString();
  }
}
