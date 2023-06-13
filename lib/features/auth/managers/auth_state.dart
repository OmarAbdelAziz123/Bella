// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

/// Create Id and Verified Email and First Name
class CreateIdAndLoadingState extends AuthState {}

class CreateIdAndSuccessState extends AuthState {}

class CreateIdAndErrorState extends AuthState {}

/// Login
class LoginBankLoadingState extends AuthState {}

class LoginBankSuccessState extends AuthState {
  String loginBank;
  Future<void> logged;

  LoginBankSuccessState({required this.loginBank, required this.logged});
}

class LoginBankErrorState extends AuthState {}

/// Check Exist or Not
class CheckExistOrNotLoadingState extends AuthState {}

class CheckExistOrNotSuccessState extends AuthState {}

class CheckExistOrNotErrorState extends AuthState {}

/// Logged
class LoggedBankLoadingState extends AuthState {}

class LoggedBankSuccessState extends AuthState {
  LoggedModel loggedModel;

  LoggedBankSuccessState({required this.loggedModel});
}

class LoggedBankErrorState extends AuthState {}

/// Register
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {}

/// Create Verification Code
class CreateVerificationCodeLoadingState extends AuthState {}

class CreateVerificationCodeSuccessState extends AuthState {}

class CreateVerificationCodeErrorState extends AuthState {}

/// Check Verification Code
class CheckVerificationCodeLoadingState extends AuthState {}

class CheckVerificationCodeSuccessState extends AuthState {}

class CheckVerificationCodeErrorState extends AuthState {}

/// Create
class CreateLoadingState extends AuthState {}

class CreateSuccessState extends AuthState {}

class CreateErrorState extends AuthState {}
