import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_firebase_ddd/domain/core/failures.dart';

import 'errors.dart';

@immutable
abstract class ValueObject<T>{
  const ValueObject();
  Either<ValueFailure<T>,T> get value;

  // Throw [UnexpectedValueError] containing [ValueFailure]
  T getOrCrash(){
    // id = identity - same as writing (right)->right
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  bool isValid() => value.isRight();


  @override
  bool operator ==(Object other) => identical(this, other) || other is ValueObject && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'Value{$value}';
  }
}