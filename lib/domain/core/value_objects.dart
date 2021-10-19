import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_firebase_ddd/domain/core/failures.dart';

@immutable
abstract class ValueObject<T>{
  const ValueObject();
  Either<ValueFailure<String>,String> get value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ValueObject && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'Value{$value}';
  }
}