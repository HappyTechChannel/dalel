import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? fristName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool? termsAndConditionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signupFormKey = GlobalKey();
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await addUserProfile();
      await verifyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SignupFailureState(errMessage: e.toString()));
    }
  }

  void _signUpHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignupFailureState(
          errMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignupFailureState(
          errMessage: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(SignupFailureState(errMessage: 'The email is invalid.'));
    } else {
      emit(SignupFailureState(errMessage: e.code));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SigninFailureState(
            errMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SigninFailureState(errMessage: 'Check your Email and password!'));
      }
    } catch (e) {
      emit(
        SigninFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }

  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "email": emailAddress,
      "frist_name": fristName,
      "last_name": lastName,
    });
  }
}
