import 'package:flutter/material.dart';

import '../../../../../domain/models/models.dart';
import '../../../../resources/routes_manager.dart';

class BuildHotelmage extends StatelessWidget {
  const BuildHotelmage({
    Key? key,
    required this.hotelData,
  }) : super(key: key);

  final HotelData hotelData;

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
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            hotelData.photos[0],
            fit: BoxFit.cover,
            width: 150,
            height: 180,
          ),
        ),
      ),
    );
  }
}
