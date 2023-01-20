import 'dart:developer' as dev;

class AppLog {
  factory AppLog() => _instance;

  AppLog._();

  static final _instance = AppLog._();

  static void log(
    dynamic error, [
    StackTrace? stackTrace,
  ]) {
    if (error is String) {
      dev.log(error);
    } else {
      dev.log(
        'Error: ',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static verbose(
    dynamic data, {
    int indents = 0,
    String? label,
    String? title,
  }) {
    if (title != null) {
      final dashes = String.fromCharCodes(
        List.filled(indents + 40, 0x2D),
      );
      log('\n$title $dashes');
    }
    final nbspShort = String.fromCharCodes(
      List.filled(indents + 2, 0x00A0),
    );

    if (data is Map) {
      if (indents == 0) {
        log('$nbspShort{ ');
      } else {
        log('$nbspShort${label ?? ''} { ');
      }
      for (final entry in data.entries) {
        verbose(
          entry.value,
          label: entry.key,
          indents: indents + 2,
        );
      }
      log('$nbspShort}');
    } else if (data is List) {
      log('$nbspShort$label [ ');
      for (final item in data) {
        verbose(item, indents: indents + 4);
      }
      log('$nbspShort]');
    } else {
      log('$nbspShort$label: ${data.runtimeType} ‣ $data');
    }
  }
}
