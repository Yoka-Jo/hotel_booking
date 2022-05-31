import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/app/app_prefs.dart';
import 'package:hotel_booking/app/constants.dart';
import 'package:hotel_booking/app/dependency_injection.dart';
import 'package:hotel_booking/domain/usecases/change_hotel_fav_state_usecase.dart';
import 'package:hotel_booking/domain/usecases/get_favourite_hotels_usecase.dart';
import 'package:hotel_booking/domain/usecases/get_hotels_usecase.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/network/requests.dart';
import '../../../../../../domain/models/models.dart';
import '../../../../../common/state_renderer/cubit/flow_state_cubit.dart';
import '../../../../../common/state_renderer/state_renderer.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getHotelsUseCase, this._changeHotelFavStateUseCase,
      this._getFavouriteHotelsUseCase)
      : super(HomeInitialState());
  final GetHotelsUseCase _getHotelsUseCase;
  final ChangeHotelFavStateUseCase _changeHotelFavStateUseCase;
  final GetFavouriteHotelsUseCase _getFavouriteHotelsUseCase;

  final AppPreferences _appPrefs = instance<AppPreferences>();
  static HomeCubit get(BuildContext context) => Provider.of<HomeCubit>(context);
  Hotels hotels = Hotels(data: [], message: "No Data Yet.");
  Map<String, dynamic> userData = {};
  FlowState _currentState = ContentState();
  List<String> favourites = [];

  Future<void> getHotels(BuildContext context,
      {int? minAmount, int? maxAmount}) async {
    if (hotels.data.isNotEmpty && minAmount == null && maxAmount == null) {
      return;
    }
    //! Loading state
    _currentState = LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState);
    context.read<FlowStateCubit>().setState(_currentState);
    //! get hotels data
    var result = await _getHotelsUseCase(HotelsRequest(
      featured: true,
      minAmount: minAmount ?? 0,
      maxAmount: maxAmount ?? 999,
      limit: Constants.numberOfHotelsToGet,
    ));
    //! check if the result is data or failure
    result.fold(
        //! can't get hotels data so current state is error
        (failure) {
      _currentState =
          ErrorState(StateRendererType.fullScreenErrorState, failure.message);
      context.read<FlowStateCubit>().setState(_currentState);
    },
        //! here we've got the hotels data
        (data) async {
      hotels = data;
      log(data.data.length.toString());
      _currentState = ContentState();
      context.read<FlowStateCubit>().setState(_currentState);
      // emit(HomeGetHotelsSuccessfullyState());
    });
  }

  Future<void> getFavouriteHotels(BuildContext context) async {
    userData = _appPrefs.getUserData();
    var result = await _getFavouriteHotelsUseCase(
        GetFavHotelsRequest(userId: userData["userId"]));
    result.fold(
      (failure) {
        log(failure.message);
        _currentState =
            ErrorState(StateRendererType.fullScreenErrorState, failure.message);
        context.read<FlowStateCubit>().setState(_currentState);
      },
      (favHotels) {
        favourites = favHotels.hotels;
        emit(HomeGetFavouritesSuccessfullyState());
      },
    );
  }

  Future<void> changeHotelFavState(BuildContext context, String hotelId) async {
    var result = await _changeHotelFavStateUseCase(ChangeHotelFavStateRequest(
        userId: userData["userId"], hotelId: hotelId));
    result.fold((failure) {
      emit(HomeFavouriteErrorState());
    }, (data) {
      if (favourites.contains(hotelId)) {
        favourites.remove(hotelId);
        emit(HomeRemoveFromFavouriteSuccessfullyState());
      } else {
        favourites.add(hotelId);
        emit(HomeAddToFavouriteSuccessfullyState());
      }
    });
  }

  bool isFavourite(String hotelId) => favourites.contains(hotelId);
}
