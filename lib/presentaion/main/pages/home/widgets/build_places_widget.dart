import 'package:flutter/material.dart';

import '../../../../../domain/models/models.dart';
import 'build_favourite_icon.dart';
import 'build_hotel_image.dart';
import 'build_hotel_name.dart';

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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            mainAxisExtent: 220,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: hotels.length,
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.topRight, children: [
                  BuildHotelmage(hotelData: hotels[i]),
                  BuildFavouriteIcon(hotelId: hotels[i].id)
                ]),
                BuildHotelName(hotelName: hotels[i].name)
              ],
            );
          }),
    );
  }
}
