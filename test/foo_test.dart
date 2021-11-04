@TestOn('browser')
import 'dart:html';

import 'package:test/test.dart';

/// import 'dart:developer';

// These can be run via the Run/Debug commands, but we don't actually get a debugger
// even if we set breakpoints or have an explicit debugger() command.

// They also get compiled with dart2js, which isn't good for debugging or fast turnaround.
void main() async {
  test('passes', () {
    // Explicitly calling debugger seems to just hang. It probably pauses but they communication
    // is messed up.
    // debugger();
    // Make sure this won't run non-web.
    window.console.log('running on the web');
    print("hello world");
    expect(2, isNotNull);
  });

  test('fails', () {
    expect(2 + 2, 5);
  });
}
