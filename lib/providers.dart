import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_firebase_ddd/domain/auth/sign_in_form/sign_in_form_notifier.dart';
import 'package:notes_firebase_ddd/domain/auth/sign_in_form/sign_in_form_state.dart';
import 'package:notes_firebase_ddd/infrastructure/auth/firebase_auth_facade.dart';


final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final googleSignInProvider = Provider((ref) => GoogleSignIn());
final iAuthFacadeProvider =
    Provider((ref) => FirebaseAuthFacade(ref.watch(firebaseAuthProvider), ref.watch(googleSignInProvider)));
final signInFormNotifierProvider = StateNotifierProvider<SignInFormNotifier, SignInFormState>(
    (ref) => SignInFormNotifier(ref.watch(iAuthFacadeProvider)));
// final signInFormNotifierProvider = StateNotifierProvider<SignInFormNotifier,SignInFormState>((ref)=>getIt<SignInFormNotifier>());
