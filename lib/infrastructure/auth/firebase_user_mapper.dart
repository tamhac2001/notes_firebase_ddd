import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_firebase_ddd/domain/auth/user.dart' as user_object;
import 'package:notes_firebase_ddd/domain/core/value_objects.dart';

extension FireBaseUserDomainX on User {
  user_object.User toDomain() {
    return user_object.User(id: UniqueId.fromUniqueString(uid));
  }
}
