part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeGetHotelsSuccessfullyState extends HomeState {}

class HomeAddToFavouriteSuccessfullyState extends HomeState {}

class HomeGetFavouritesSuccessfullyState extends HomeState {}

class HomeRemoveFromFavouriteSuccessfullyState extends HomeState {}

class HomeFavouriteErrorState extends HomeState {}
