import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/presentaion/resources/assets_manager.dart';
import 'package:hotel_booking/presentaion/resources/colors_manager.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';

import '../../domain/models/models.dart';
import 'widgets/bottomsheet_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  final List<OnBoardingData> onboardingList = [
    OnBoardingData(
      image: ImageAssets.cityLogo,
      title: AppStrings.onboardingTitlePage_1.tr(),
      desc: AppStrings.onboardingDescPage_1.tr(),
    ),
    OnBoardingData(
      image: ImageAssets.hotelLogo,
      title: AppStrings.onboardingTitlePage_2.tr(),
      desc: AppStrings.onboardingDescPage_2.tr(),
    ),
    OnBoardingData(
      image: ImageAssets.bookingLogo,
      title: AppStrings.onboardingTitlePage_3.tr(),
      desc: AppStrings.onboardingDescPage_3.tr(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        leading: const SizedBox.shrink(),
      ),
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: onboardingList.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(onboardingList[i].image, width: 200),
                const SizedBox(
                  height: 15,
                ),
                Text(onboardingList[i].title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: AppColors.red)),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  onboardingList[i].desc,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: BottomSheetWidget(currentIndex: currentIndex),
    );
  }
}
