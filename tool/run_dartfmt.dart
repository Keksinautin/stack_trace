import 'dart:io';

void main() {
  var result = Process.runSync('dartfmt', ['-l', '120', '-n', '.']);
  print(result.stdout ?? result.stderr);

  if (result.exitCode != 0) {
    exitCode = 1;
    return;
  }

  if (result.stdout is String && (result.stdout as String).isNotEmpty) {
    exitCode = 1;
    return;
  }
}