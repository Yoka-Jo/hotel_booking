import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/presentaion/main/pages/favourite/widgets/build_favourite_hotel.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';
import '../home/viewmodel/cubit/home_cubit.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final favouriteHotels = HomeCubit.get(context).favouriteHotels;
          log(favouriteHotels.length.toString());
          if (favouriteHotels.isEmpty) {
            return Center(
              child: Text(AppStrings.addYourFavouriteHotels.tr()),
            );
          }
          return ListView.separated(
            itemCount: favouriteHotels.length,
            itemBuilder: (context, i) {
              return BuildFavouriteHotel(favouriteHotel: favouriteHotels[i]);
            },
            separatorBuilder: (context, i) {
              return const SizedBox(
                height: 15.0,
              );
            },
          );
        },
      ),
    );
  }
}
