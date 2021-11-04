@TestOn('browser')
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

part 'json_test.g.dart';

// These run via the Run/Debug commands but only if build_runner has been invoked.
// If we change what the code-generation will do by commenting or uncommenting a variable
// in Person, and we re-run the test here, it will fail (or start passing) if we're
// running it through `dart test`. If we run it through build_runner test then the
// code generation will be re-run.
main() {
  test('serializable passes only if codegen has been run', () {
    var p = Person(firstName: 'First', lastName: 'Last');
    var json = p.toJson();
    expect(json['firstName'], 'First');
    // One of these will be true, depending if the variable `foo` is in the
    // class definition below.
    expect(json['foo'], null);
    expect(json['foo'], 'abc');
  });

  test('serializable fail', () {
    var p = Person(firstName: 'First', lastName: 'Last');
    var json = p.toJson();
    expect(json['firstName'], 'WrongAnswer');
  });
}

@JsonSerializable()
class Person {
  /// The generated code assumes these values exist in JSON.
  final String firstName, lastName;

  // If we comment or uncomment this line it changes the generated code and thus
  // what the test expectation will be.
  // String foo = 'abc';

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime dateOfBirth;

  Person({this.firstName, this.lastName, this.dateOfBirth});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
