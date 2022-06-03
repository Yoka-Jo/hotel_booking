import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

class BuildClickForMoreButton extends StatelessWidget {
  const BuildClickForMoreButton({
    Key? key,
    required this.hotelData,
  }) : super(key: key);

  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(Routes.webViewRoute, arguments: hotelData.url);
          },
          child: Text(AppStrings.clickForDetails.tr()),
        ),
      ),
    );
  }
}
