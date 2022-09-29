import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2.h,
            crossAxisSpacing: 2.8.w,
            mainAxisExtent: 35.h,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: hotels.length,
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.topRight, children: [
                  SizedBox(
                      width: 100.w,
                      height: 29.h,
                      child: BuildHotelmage(
                        hotelData: hotels[i],
                        borderRadius: 8.0,
                      )),
                  BuildFavouriteIcon(
                    hotelId: hotels[i].id,
                    borderRadius: 8.0,
                  )
                ]),
                BuildHotelName(hotelName: hotels[i].name)
              ],
            );
          }),
    );
  }
}
