import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';

class BuildHotelDetailsImage extends StatelessWidget {
  const BuildHotelDetailsImage({
    Key? key,
    required this.hotelData,
  }) : super(key: key);

  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: hotelData.id,
          child: Image.network(
            hotelData.photos[0],
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            padding: const EdgeInsets.all(8),
            child: Text(
              hotelData.city.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
