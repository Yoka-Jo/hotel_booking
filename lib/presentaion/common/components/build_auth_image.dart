import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class BuildAuthImage extends StatelessWidget {
  final String imagePath;
  const BuildAuthImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: SvgPicture.asset(
        imagePath,
      ),
    );
  }
}
