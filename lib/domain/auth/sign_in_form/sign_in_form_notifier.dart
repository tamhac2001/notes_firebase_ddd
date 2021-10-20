import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_firebase_ddd/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd/domain/auth/sign_in_form/sign_in_form_state.dart';

class SignInFormNotifier extends StateNotifier<SignInFormState>{
  final IAuthFacade _authFacade;
  SignInFormNotifier(this._authFacade):super(SignInFormState.initial());
}