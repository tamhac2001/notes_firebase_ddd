import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_firebase_ddd/domain/auth/user.dart' as app_user;
import 'package:notes_firebase_ddd/domain/core/value_objects.dart';

extension FireBaseUserDomainX on User {
  app_user.User toDomain() {
    return app_user.User(id: UniqueId.fromUniqueString(uid));
  }
}
