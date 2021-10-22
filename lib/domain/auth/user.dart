import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd/domain/core/value_objects.dart';

part 'user.freezed.dart';

// part 'user.g.dart';

@freezed
class User with _$User {
  // @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory User({
    required UniqueId id,
  }) = _User;

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
