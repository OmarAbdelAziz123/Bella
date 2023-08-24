part of 'myoffers_cubit.dart';

@immutable
abstract class MyoffersState {}

class MyoffersInitialState extends MyoffersState {}

/// Get All Personal Offers By Users
class GetAllPersonalOffersByUsersLoadingState extends MyoffersState {}

class GetAllPersonalOffersByUsersSuccessState extends MyoffersState {}

class GetAllPersonalOffersByUsersErrorState extends MyoffersState {}
