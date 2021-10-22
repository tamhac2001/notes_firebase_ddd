import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_firebase_ddd/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd/domain/auth/sign_in_form/sign_in_form_state.dart';
import 'package:notes_firebase_ddd/domain/auth/value_objects.dart';

class SignInFormNotifier extends StateNotifier<SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormNotifier(this._authFacade) : super(SignInFormState.initial());

  void emailChanged(String input) {
    state = state.copyWith(
      emailAddress: EmailAddress(input),
      authFailureOrSuccessOption: none(),
    );
  }

  void passwordChanged(String input) {
    state = state.copyWith(
      password: Password(input),
      authFailureOrSuccessOption: none(),
    );
  }

  void registerWithEmailAndPasswordPressed() {
    _performActionOnAuthFacadeWithEmailAndPassword(_authFacade.registerWithEmailAndPassword);
  }

  void signInWithEmailAndPasswordPressed() {
    _performActionOnAuthFacadeWithEmailAndPassword(_authFacade.signInWithEmailAndPassword);
  }

  Future<void> signInWithGooglePressed() async {
    state = state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    );
    final failureOrSuccess = await _authFacade.signInWithGoogle();
    state = state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: some(failureOrSuccess),
    );
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
      Future<Either<AuthFailure, Unit>> Function({required EmailAddress emailAddress, required Password password})
          forwardedCall) async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      state = state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      failureOrSuccess = await forwardedCall(emailAddress: state.emailAddress, password: state.password);
      state = state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess),
      );
    }
    state = state.copyWith(
      isSubmitting: false,
      showErrorMessages: AutovalidateMode.always,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
