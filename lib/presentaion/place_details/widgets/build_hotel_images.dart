import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';

class BuildHotelImages extends StatelessWidget {
  const BuildHotelImages({
    Key? key,
    required this.hotelData,
  }) : super(key: key);

  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: hotelData.photos.length,
        itemBuilder: (context, i) {
          return SizedBox(
            height: 200,
            width: 200,
            child: Image.network(
              hotelData.photos[i],
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (context, i) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
