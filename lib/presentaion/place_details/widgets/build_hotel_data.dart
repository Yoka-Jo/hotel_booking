import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/presentaion/common/components/build_divider.dart';
import 'package:hotel_booking/presentaion/place_details/widgets/build_hotel_info.dart';
import 'package:hotel_booking/presentaion/place_details/widgets/build_title.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';

import '../../../domain/models/models.dart';
import '../../resources/colors_manager.dart';
import '../../resources/routes_manager.dart';
import 'build_body_text.dart';
import 'build_hotel_images.dart';

class BuildHotelData extends StatelessWidget {
  const BuildHotelData({
    Key? key,
    required this.hotelData,
  }) : super(key: key);

  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildHotelImages(hotelData: hotelData),
          const SizedBox(
            height: 10.0,
          ),
          //name and desc
          BuildHotelInfo(
            title: hotelData.name,
            bodyText: hotelData.desc,
            isStringEnglish: true,
          ),
          const BuildDivider(),
          //cheapest price
          BuildHotelInfo(
              title: AppStrings.cheapestPrice.tr(),
              bodyText: "${hotelData.cheapestPrice}"),
          const BuildDivider(),
          //address
          BuildTitle(title: AppStrings.address.tr()),
          Row(
            children: [
              Expanded(child: BuildBodyText(bodyText: hotelData.address)),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          Routes.mapRoute,
                          arguments: Location(
                            longitude: hotelData.long,
                            latitude: hotelData.lat,
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.showLocation.tr(),
                        style: const TextStyle(color: AppColors.primary),
                      )),
                ),
              )
            ],
          ),
          const BuildDivider(),
          //distance
          BuildHotelInfo(
            title: AppStrings.distance.tr(),
            bodyText: hotelData.distance,
          ),
        ],
      ),
    );
  }
}
