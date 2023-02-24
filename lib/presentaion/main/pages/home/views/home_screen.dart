import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/presentaion/auth_type/viewmodel/helpers/authentication_helper.dart';
import 'package:hotel_booking/presentaion/common/components/show_toast.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';

import '../../../../../app/dependency_injection.dart';
import '../../../../common/state_renderer/cubit/flow_state_cubit.dart';
import '../../../cubit/main_cubit.dart';
import '../widgets/build_places_widget.dart';
import '../widgets/build_search_widget.dart';
import '../widgets/build_welcome_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthenticationHelper _auth = instance<AuthenticationHelper>();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _auth.autoLogout(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is MainAddToFavouriteSuccessfullyState) {
          showToast(AppStrings.addHotelToFav.tr(), ToastState.success);
        }
        if (state is MainFavouriteErrorState) {
          showToast(
              AppStrings.errorChangingHotelFavState.tr(), ToastState.failure);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (focusNode.hasFocus) {
              context.read<MainCubit>().getHotels(context);
            }
            focusNode.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            body: RefreshIndicator(
              color: Theme.of(context).primaryColor,
              onRefresh: () async {
                context.read<MainCubit>().getHotels(context);
              },
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BuildWelcomWidget(),
                    SizedBox(
                      height: 45.h,
                    ),
                    BuildSearchWidget(
                      scaffoldKey: scaffoldKey,
                      homeContext: context,
                      focusNode: focusNode,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    if (!MainCubit.get(context).isSearching)
                      BlocBuilder<FlowStateCubit, FlowStateState>(
                        builder: (context, state) {
                          log(state.currentState.toString());
                          log(MainCubit.get(context)
                              .hotels
                              .data
                              .length
                              .toString());
                          return state.currentState.getScreenWidget(
                            context,
                            BuildPlacesWidget(
                              hotels: MainCubit.get(context).hotels.data,
                            ),
                            () {
                              context.read<MainCubit>()
                                ..getHotels(context)
                                ..getFavouriteHotels(context);
                            },
                          );
                        },
                      )
                    else if (MainCubit.get(context).isSearching)
                      if (state is MainSearchLoadingState)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else
                        BuildPlacesWidget(
                          hotels: MainCubit.get(context).searchedHotels.data,
                        ),
                  ],
                ),
              )),
            ),
          ),
        );
      },
    );
  }
}

/*

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthenticationHelper _auth = instance<AuthenticationHelper>();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _auth.autoLogout(context);
    context.read<MainCubit>()
      ..getHotels(context)
      ..getFavouriteHotels(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlowStateCubit, FlowStateState>(
      builder: (context, state) {
        return state.currentState.getScreenWidget(
          context,
          _getContentWidget(context),
          () {
            context.read<MainCubit>()
              ..getHotels(context)
              ..getFavouriteHotels(context);
          },
        );
      },
    );
  }

  Widget _getContentWidget(BuildContext ctx) {
    return InkWell(
      onTap: () {
        FocusScope.of(ctx).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state is HomeAddToFavouriteSuccessfullyState) {
              showToast(AppStrings.addHotelToFav.tr(), ToastState.success);
            }
            if (state is HomeFavouriteErrorState) {
              showToast(AppStrings.errorChangingHotelFavState.tr(),
                  ToastState.failure);
            }
          },
          builder: (context, state) {
            final cubit = MainCubit.get(context);
            final hotels = cubit.hotels.data;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BuildWelcomWidget(),
                    SizedBox(
                      height: 45.h,
                    ),
                    BuildSearchWidget(
                      scaffoldKey: scaffoldKey,
                      homeContext: ctx,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    if (!cubit.isSearching)
                      BuildPlacesWidget(hotels: hotels)
                    else
                      const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

*/