import 'package:notes_firebase_ddd/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encounter a ValueFailure at an unrecoverable point.Terminating.';
    return '$explanation Failure was: $valueFailure' ;
  }
}
