import 'dart:async';

main() async {
  print("hello world");
  for (var i = 0; i <= 10; i++) {
    await Future.delayed(Duration(seconds: 3));
    print("hello again");
  }
  throw 'finished';
}
