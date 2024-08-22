import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cubit_states.dart';


class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final VoidCallback onLoginSuccess;
  LoginCubit({required this.onLoginSuccess}) : super(LoginInitial());


//Login logic
  Future<void> login(String email, String password) async {
    emit(LoginLoading()); // Emit loading state

    try {

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );


      if (userCredential.user != null) {
        emit(LoginSuccess());
        onLoginSuccess();// Emit success state if login is successful
      } else {
        emit(LoginError("Invalid credentials")); // Emit error state
      }
    } catch (e) {
      emit(LoginError(e.toString())); // Emit error state on exception
    }
  }
}
