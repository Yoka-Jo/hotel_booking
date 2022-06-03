import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/colors_manager.dart';
import '../pages/home/viewmodel/cubit/home_cubit.dart';

class BuildFavouriteIcon extends StatelessWidget {
  const BuildFavouriteIcon({
    Key? key,
    required this.hotelId,
    required this.borderRadius,
  }) : super(key: key);
  final String hotelId;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        context.read<HomeCubit>().changeHotelFavState(hotelId);
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Icon(
          Icons.favorite,
          color: HomeCubit.get(context).isFavourite(hotelId)
              ? AppColors.red
              : Colors.grey,
        ),
      ),
    );
  }
}
