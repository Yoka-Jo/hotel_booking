part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitialState extends MainState {}

class MainAddToFavouriteSuccessfullyState extends MainState {}

class MainRemoveFromFavouriteSuccessfullyState extends MainState {}

class MainFavouriteErrorState extends MainState {}

class MainSearchLoadingState extends MainState {}

class MainCloseSearchingState extends MainState {}

class MainSearchSuccessState extends MainState {}

class MainClearHotelsSuccessState extends MainState {}

class MainGetFavouriteHotelsSuccessState extends MainState {}

class MainSetSearchingToTrueState extends MainState {}

class MainSetSearchingToFalseState extends MainState {}
