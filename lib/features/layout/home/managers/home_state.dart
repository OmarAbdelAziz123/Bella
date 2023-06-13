part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

/// Get Recommended Data
class GetRecommendedLoadingState extends HomeState {}

class GetRecommendedSuccessState extends HomeState {}

class GetRecommendedErrorState extends HomeState {}

/// Get All Companies
class GetAllCompaniesLoadingState extends HomeState {}

class GetAllCompaniesSuccessState extends HomeState {}

class GetAllCompaniesErrorState extends HomeState {}

/// Create Join
class CreateJoinLoadingState extends HomeState {}

class CreateJoinSuccessState extends HomeState {}

class CreateJoinErrorState extends HomeState {}

/// Get Data Profile
class GetCompanyProfileLoadingState extends HomeState {}

class GetCompanyProfileSuccessState extends HomeState {}

class GetCompanyProfileErrorState extends HomeState {}
