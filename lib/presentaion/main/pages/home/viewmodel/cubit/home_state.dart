part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeAddToFavouriteSuccessfullyState extends HomeState {}

class HomeRemoveFromFavouriteSuccessfullyState extends HomeState {}

class HomeFavouriteErrorState extends HomeState {}

class HomeSearchLoagingState extends HomeState {}

class HomeSearchSuccessState extends HomeState {}

class HomeClearHotelsSuccessState extends HomeState {}

class HomeGetFavouriteHotelsSuccessState extends HomeState {}
