import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/models/models.dart';
import '../../../widgets/build_favourite_icon.dart';
import '../../../widgets/build_hotel_image.dart';
import '../../../widgets/build_hotel_name.dart';

class BuildPlacesWidget extends StatelessWidget {
  const BuildPlacesWidget({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  final List<HotelData> hotels;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0.h,
            crossAxisSpacing: 20.w,
            childAspectRatio: 0.65,
          ),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          itemCount: hotels.length,
          itemBuilder: (context, i) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.topRight, children: [
                  SizedBox(
                    height: 200.h,
                    child: BuildHotelmage(
                      hotelData: hotels[i],
                      borderRadius: 8.0,
                    ),
                  ),
                  BuildFavouriteIcon(
                    hotelId: hotels[i].id,
                    borderRadius: 8.0,
                  )
                ]),
                SizedBox(height: 3.h),
                BuildHotelName(hotelName: hotels[i].name)
              ],
            );
          }),
    );
  }
}
