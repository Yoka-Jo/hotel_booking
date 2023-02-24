import 'package:flutter/material.dart';

class BuildHotelName extends StatelessWidget {
  const BuildHotelName({
    Key? key,
    required this.hotelName,
  }) : super(key: key);

  final String hotelName;

  @override
  Widget build(BuildContext context) {
    return Text(
      hotelName,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
