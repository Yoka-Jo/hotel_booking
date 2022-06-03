import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/presentaion/auth_type/viewmodel/helpers/authentication_helper.dart';
import 'package:hotel_booking/presentaion/common/components/show_toast.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:hotel_booking/presentaion/main/pages/home/viewmodel/cubit/home_cubit.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';

import '../../../../../app/dependency_injection.dart';
import '../../../../common/state_renderer/cubit/flow_state_cubit.dart';
import '../widgets/build_places_widget.dart';
import '../widgets/build_search_widget.dart';
import '../widgets/build_welcome_widget.dart';

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
    context.read<HomeCubit>().getHotels(context);
    // ..getFavouriteHotels(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlowStateCubit, FlowStateState>(
      builder: (context, state) {
        return state.currentState.getScreenWidget(
          context,
          _getContentWidget(context),
          () {
            context.read<HomeCubit>()
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
        body: BlocConsumer<HomeCubit, HomeState>(
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
            final cubit = HomeCubit.get(context);
            final hotels = cubit.hotels.data;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BuildWelcomWidget(),
                    const SizedBox(
                      height: 45,
                    ),
                    BuildSearchWidget(
                      scaffoldKey: scaffoldKey,
                      homeContext: ctx,
                    ),
                    const SizedBox(
                      height: 25,
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
