//  Copyright 2017, Google Inc. All rights reserved.
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are
//  met:
//
//  * Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above
//  copyright notice, this list of conditions and the following
//  disclaimer in the documentation and/or other materials provided
//  with the distribution.
//  * Neither the name of package:dom nor the names of its
//  contributors may be used to endorse or promote products derived
//  from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
//  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
//  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//      SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
//
//  The author: Matan Lurey/Google Inc. <matanl@google.com>

import 'dart:io';

/// If `COVERALLS_TOKEN` is present in the environment, collect coverage.
void main() {
  final coverallsToken = Platform.environment['COVERALLS_TOKEN'];
  if (coverallsToken == null) {
    print('No environment variable COVERALLS_TOKEN found.');
    return;
  }
  print('Installing dart_coveralls...');
  var result = Process.runSync('pub', ['global', 'activate', 'dart_coveralls']);
  print(result.stdout ?? result.stderr);
  if (result.exitCode != 0) {
    exitCode = 1;
    return;
  }
  print('Running dart_coveralls...');
  result = Process.runSync('pub', [
    'global',
    'run',
    'dart_coveralls',
    'report',
    '--token=$coverallsToken',
    '--retry=2',
    '--exclude-test-files',
    'tool/all_tests.dart',
  ]);
  print(result.stdout);
  print(result.stderr);
  if (result.exitCode != 0) {
    exitCode = 1;
  } else {
    print('Done!');
  }
}