import 'package:flutter/material.dart';
import 'package:hotel_booking/app/app_prefs.dart';
import 'package:hotel_booking/app/functions.dart';
import '../../../app/dependency_injection.dart';
import '../../resources/colors_manager.dart';
import '../../resources/routes_manager.dart';

class BottomSheetWidget extends StatelessWidget {
  final AppPreferences _appPrefs = instance<AppPreferences>();
  final int currentIndex;
  BottomSheetWidget({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      color: isLightTheme(context) ? Colors.white : Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              await _appPrefs.saveIsOnBoardingScreenViewed();
              Navigator.of(context).pushReplacementNamed(Routes.authTypeRoute);
            },
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primary,
              child: Center(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 30,
              )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => _getPropperCircle(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPropperCircle(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: currentIndex == index ? 30 : 15,
      margin: const EdgeInsets.only(right: 7),
      height: 4.0,
      decoration: BoxDecoration(
        color: currentIndex == index ? AppColors.primary : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
