import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/colors_manager.dart';
import '../viewmodel/cubit/home_cubit.dart';

class BuildFavouriteIcon extends StatelessWidget {
  const BuildFavouriteIcon({
    Key? key,
    required this.hotelId,
  }) : super(key: key);
  final String hotelId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        context.read<HomeCubit>().changeHotelFavState(context, hotelId);
      },
      child: CircleAvatar(
        child: Icon(
          Icons.favorite,
          color: HomeCubit.get(context).isFavourite(hotelId)
              ? AppColors.red
              : Colors.grey,
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
