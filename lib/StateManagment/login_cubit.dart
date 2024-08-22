import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cubit_states.dart';

// Cubit class
class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginCubit() : super(LoginInitial());

  // Method to handle login logic
  Future<void> login(String email, String password) async {
    emit(LoginLoading()); // Emit loading state

    try {
      // Simulate a login process with a delay
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Replace with actual authentication logic

      if (userCredential.user != null) {
        emit(LoginSuccess()); // Emit success state if login is successful
      } else {
        emit(LoginError("Invalid credentials")); // Emit error state
      }
    } catch (e) {
      emit(LoginError(e.toString())); // Emit error state on exception
    }
  }
}
