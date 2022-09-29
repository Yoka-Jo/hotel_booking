import 'package:flutter/material.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/presentaion/main/widgets/build_hotel_image.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/build_favourite_icon.dart';
import '../../../widgets/build_hotel_name.dart';

class BuildFavouriteHotel extends StatelessWidget {
  const BuildFavouriteHotel({Key? key, required this.favouriteHotel})
      : super(key: key);
  final HotelData favouriteHotel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Column(
        children: [
          Stack(alignment: Alignment.topRight, children: [
            SizedBox(
                width: double.infinity,
                height: 28.h,
                child: BuildHotelmage(
                  hotelData: favouriteHotel,
                  borderRadius: 0.0,
                )),
            BuildFavouriteIcon(
              hotelId: favouriteHotel.id,
              borderRadius: 0.0,
            )
          ]),
          BuildHotelName(hotelName: favouriteHotel.name)
        ],
      ),
    );
  }
}
