import 'package:flutter/material.dart';
import 'package:hotel_booking/app/functions.dart';
import '../../resources/colors_manager.dart';

class BottomSheetWidget extends StatelessWidget {
  final int currentIndex;
  const BottomSheetWidget({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      color: isLightTheme(context) ? Colors.white : Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => _getPropperCircle(index),
        ),
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
