import 'package:equatable/equatable.dart';

// Base state class
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

// Initial state
class LoginInitial extends LoginState {}

// Loading state
class LoginLoading extends LoginState {}

// Success state
class LoginSuccess extends LoginState {}

// Error state
class LoginError extends LoginState {
  final String error;

  const LoginError(this.error);

  @override
  List<Object> get props => [error];
}
