import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';
import '../../resources/routes_manager.dart';

class BuildHotelmage extends StatelessWidget {
  const BuildHotelmage({
    Key? key,
    required this.hotelData,
    required this.borderRadius,
  }) : super(key: key);

  final HotelData hotelData;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.placeDetailsRoute, arguments: hotelData);
      },
      child: Hero(
        tag: hotelData.id,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.network(
            hotelData.photos[0],
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
