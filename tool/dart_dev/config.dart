import 'package:dart_dev/dart_dev.dart';
import 'package:glob/glob.dart';

final config = {
  'serve': WebdevServeTool()
    ..webdevArgs = ['web:8080', '--release']
    ..buildArgs = ['--delete-conflicting-outputs'],
};
