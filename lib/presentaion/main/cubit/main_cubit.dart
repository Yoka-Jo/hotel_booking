import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/app/app_prefs.dart';
import 'package:hotel_booking/app/constants.dart';
import 'package:hotel_booking/app/dependency_injection.dart';
import 'package:hotel_booking/domain/usecases/change_hotel_fav_state_usecase.dart';
import 'package:hotel_booking/domain/usecases/get_favourite_hotels_usecase.dart';
import 'package:hotel_booking/domain/usecases/get_hotels_usecase.dart';
import 'package:hotel_booking/domain/usecases/search_for_hotels_usecase.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:provider/provider.dart';
import '../../../../../../data/network/requests.dart';
import '../../../../../../domain/models/models.dart';
import '../../common/state_renderer/cubit/flow_state_cubit.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../resources/strings_manager.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._getHotelsUseCase, this._changeHotelFavStateUseCase,
      this._getFavouriteHotelsUseCase, this._searchForHotelsUseCase)
      : super(MainInitialState());
  final GetHotelsUseCase _getHotelsUseCase;
  final ChangeHotelFavStateUseCase _changeHotelFavStateUseCase;
  final GetFavouriteHotelsUseCase _getFavouriteHotelsUseCase;
  final SearchForHotelsUseCase _searchForHotelsUseCase;

  final AppPreferences _appPrefs = instance<AppPreferences>();
  static MainCubit get(BuildContext context) => Provider.of<MainCubit>(context);
  Hotels hotels =
      Hotels(data: const [], message: AppStrings.noHotelsFound.tr());

  Hotels searchedHotels =
      Hotels(data: const [], message: AppStrings.noHotelsFound.tr());

  List<HotelData> favouriteHotels = [];
  List<String> favouriteHotelsIds = [];
  Map<String, dynamic> userData = {};
  FlowState _currentState = ContentState();
  bool isSearching = false;

  Future<void> getHotels(BuildContext context,
      {int minAmount = 0, int maxAmount = 999}) async {
    //! Loading state
    _currentState = LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState);
    context.read<FlowStateCubit>().setState(_currentState);
    //! get hotels data
    var result = await _getHotelsUseCase(HotelsRequest(
      featured: true,
      minAmount: minAmount,
      maxAmount: maxAmount,
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
      getFavouriteHotels(context).then((_) {
        hotels = data;
        favouriteHotels = [];

        for (int i = 0; i < hotels.data.length; i++) {
          for (var id in favouriteHotelsIds) {
            if (id == hotels.data[i].id) {
              favouriteHotels.add(hotels.data[i]);
            }
          }
        }

        _currentState = ContentState();
        context.read<FlowStateCubit>().setState(_currentState);
      });
    });
  }

  Future<void> getFavouriteHotels(BuildContext context) async {
    if (favouriteHotels.isNotEmpty) {
      return;
    }
    userData = _appPrefs.getUserData();
    var result = await _getFavouriteHotelsUseCase(
        GetFavHotelsRequest(userId: userData["userId"]));
    result.fold(
      (failure) {
        _currentState =
            ErrorState(StateRendererType.fullScreenErrorState, failure.message);
        context.read<FlowStateCubit>().setState(_currentState);
      },
      (favHotels) {
        favouriteHotelsIds = favHotels.hotels;
      },
    );
  }

  Future<void> changeHotelFavState(String hotelId) async {
    var result = await _changeHotelFavStateUseCase(ChangeHotelFavStateRequest(
        userId: userData["userId"], hotelId: hotelId));
    result.fold((failure) {
      emit(MainFavouriteErrorState());
    }, (data) {
      if (favouriteHotelsIds.contains(hotelId)) {
        favouriteHotels.removeWhere((element) => element.id == hotelId);
        favouriteHotelsIds.remove(hotelId);
        emit(MainRemoveFromFavouriteSuccessfullyState());
      } else {
        favouriteHotels
            .add(hotels.data.firstWhere((element) => element.id == hotelId));
        favouriteHotelsIds.add(hotelId);
        emit(MainAddToFavouriteSuccessfullyState());
      }
    });
  }

  Future<void> searchForHotels(BuildContext context, String name) async {
    if (name.isEmpty) {
      return;
    }

    setSearchingTrue();

    //! get hotels data
    var result =
        await _searchForHotelsUseCase(SearchForHotelsRequest(hotelName: name));
    //! check if the result is data or failure
    result.fold(
        //! can't get hotels data so current state is error
        (failure) {
      _currentState =
          ErrorState(StateRendererType.popupErrorState, failure.message);
      context.read<FlowStateCubit>().setState(_currentState);
    },
        //! here we've got the hotels data
        (hotelsData) async {
      searchedHotels = hotelsData.data.isNotEmpty
          ? hotelsData
          : Hotels(data: const [], message: AppStrings.noHotelsFound.tr());

      emit(MainSearchSuccessState());
    });
  }

  void setSearchingTrue() {
    isSearching = true;
    emit(MainSearchLoadingState());
  }

  void setSearchingFalse() {
    isSearching = false;
    emit(MainCloseSearchingState());
  }

  void clearHotels() {
    hotels = Hotels(data: const [], message: AppStrings.noHotelsFound.tr());
    emit(MainClearHotelsSuccessState());
  }

  void clearFavouriteHotels() {
    favouriteHotels.clear();
    emit(MainClearHotelsSuccessState());
  }

  bool isFavourite(String hotelId) => favouriteHotelsIds.contains(hotelId);
}
