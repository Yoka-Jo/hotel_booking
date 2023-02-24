import 'package:flutter/material.dart';
import 'package:hotel_booking/domain/models/models.dart';

import '../widgets/build_click_for_more_button.dart';
import '../widgets/build_hotel_data.dart';
import '../widgets/build_hotel_details_image.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({
    Key? key,
    required this.hotelData,
  }) : super(key: key);
  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotelData.title),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BuildHotelDetailsImage(hotelData: hotelData),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildHotelData(hotelData: hotelData),
                  BuildClickForMoreButton(hotelData: hotelData)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
