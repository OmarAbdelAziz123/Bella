part of 'wish_list_cubit.dart';

@immutable
abstract class WishListState {}

class WishListInitialState extends WishListState {}

/// Wish List States
class WishListListLoadingState extends WishListState {}

class WishListListSuccessState extends WishListState {}

class WishListErrorState extends WishListState {}
