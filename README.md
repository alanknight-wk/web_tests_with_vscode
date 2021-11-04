An example of tests that it would be nice to be able to run from VSCode using Dart-Code.

There's a trivial main.dart. That doesn't ehibit the problem I was seeing with restart, I'll take another look.

There are two test files, one that doesn't use anything, and one that uses json_serializable.
  - The tests are being run via regular test, so the ones that need build_runner will only run if it's been run separately and the code is up to date.
  - Debugging doesn't work on any of them. They can be run, but breakpoints aren't set, and even debugger() doesn't work. If I add the
  - They need a complicated launch.json that isn't documented anywhere that I've seen.
  - If "All Exceptions" is checked in Breakpoints then it gives an error about connection being hijacked.
