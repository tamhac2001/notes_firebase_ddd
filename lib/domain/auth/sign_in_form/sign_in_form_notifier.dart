import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_ddd/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd/domain/auth/sign_in_form/sign_in_form_state.dart';
import 'package:notes_firebase_ddd/domain/auth/value_objects.dart';

@injectable
class SignInFormNotifier extends StateNotifier<SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormNotifier(this._authFacade) : super(SignInFormState.initial());

  Future<void> emailChanged(String input) async {
    state.copyWith(
      emailAddress: EmailAddress(input),
      authFailureOrSuccessOption: none(),
    );
  }

  Future<void> passwordChanged(String input) async {
    state.copyWith(
      password: Password(input),
      authFailureOrSuccessOption: none(),
    );
  }

  Future<void> registerWithEmailAndPasswordPressed() async {
    await _performActionOnAuthFacadeWithEmailAndPassword(_authFacade.registerWithEmailAndPassword);
  }

  Future<void> signInWithEmailAndPasswordPressed() async {
    await _performActionOnAuthFacadeWithEmailAndPassword(_authFacade.signInWithEmailAndPassword);
  }

  Future<void> signInWithGooglePressed(String input) async {
    state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    );
    final failureOrSuccess = await _authFacade.signInWithGoogle();
    state.copyWith(
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
      state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      failureOrSuccess = await forwardedCall(emailAddress: state.emailAddress, password: state.password);
      state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess),
      );
    }
    state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
