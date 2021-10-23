import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_firebase_ddd/application/auth/auth_state.dart';
import 'package:notes_firebase_ddd/domain/auth/i_auth_facade.dart';

class AuthNotifier extends StateNotifier<AuthState>{
  final IAuthFacade _authFacade;

  AuthNotifier(this._authFacade) : super(const AuthState.initial());

  void authCheckRequested(){
    final userOption = _authFacade.getSignedInUser();
    state = userOption.fold(() => const AuthState.unauthenticated(), (_) => const AuthState.authenticated());
  }

  Future<void> signedOut()async{
    await _authFacade.signOut();
    state = const AuthState.unauthenticated();
  }

}