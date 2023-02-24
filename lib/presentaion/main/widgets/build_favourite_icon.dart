import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';
import '../cubit/main_cubit.dart';

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
        context.read<MainCubit>().changeHotelFavState(hotelId);
      },
      child: Container(
        height: 40.w,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Icon(
          Icons.favorite,
          color: MainCubit.get(context).isFavourite(hotelId)
              ? AppColors.red
              : Colors.grey,
        ),
      ),
    );
  }
}
