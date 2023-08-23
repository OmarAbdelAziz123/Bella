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

/// Get All Recommended Products
class GetAllRecommendedProductsLoadingState extends HomeState {}

class GetAllRecommendedProductsSuccessState extends HomeState {}

class GetAllRecommendedProductsErrorState extends HomeState {}

/// Get Products By Company
class GetProductsByCompanyLoadingState extends HomeState {}

class GetProductsByCompanySuccessState extends HomeState {}

class GetProductsByCompanyErrorState extends HomeState {}

/// Get Company Products
class GetCompanyProductsLoadingState extends HomeState {}

class GetCompanyProductsSuccessState extends HomeState {}

class GetCompanyProductsErrorState extends HomeState {}

class GetWishListErrorState extends HomeState {}

/// Delete From Cart
class DeleteOneItemFromCartLoadingState extends HomeState {}

class DeleteOneItemFromCartSuccessState extends HomeState {}

class DeleteOneItemFromCartErrorState extends HomeState {}

/// Add To Cart
class AddCartLoadingState extends HomeState {}

class AddCartSuccessState extends HomeState {}

class AddCartErrorState extends HomeState {}

/// Reward
class CompanyProfileLoadingState extends HomeState {}

class CompanyProfileSuccessState extends HomeState {}

class CompanyProfileErrorState extends HomeState {}

/// Reset
class ResetLoadingState extends HomeState {}

class ResetSuccessState extends HomeState {}

class ResetErrorState extends HomeState {}

/// Get Products By Category
class GetProductsByCategpryLoadingState extends HomeState {}

class GetProductsByCategprySuccessState extends HomeState {}

class GetProductsByCategpryErrorState extends HomeState {}
