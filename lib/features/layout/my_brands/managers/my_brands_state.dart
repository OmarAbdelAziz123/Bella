part of 'my_brands_cubit.dart';

@immutable
abstract class MyBrandsState {}

class MyBrandsInitialState extends MyBrandsState {}

/// Joined
class JoinedLoadingState extends MyBrandsState {}

class JoinedSuccessState extends MyBrandsState {}

class JoinedErrorState extends MyBrandsState {}

/// Not joined
class NotJoinedLoadingState extends MyBrandsState {}

class NotJoinedSuccessState extends MyBrandsState {}

class NotJoinedErrorState extends MyBrandsState {}

/// Get Terms and Conditions
class GetTermsAndConditionsLoadingState extends MyBrandsState {}

class GetTermsAndConditionsSuccessState extends MyBrandsState {}

class GetTermsAndConditionsErrorState extends MyBrandsState {}
