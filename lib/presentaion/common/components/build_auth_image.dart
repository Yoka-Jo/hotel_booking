import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildAuthImage extends StatelessWidget {
  final String imagePath;
  const BuildAuthImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: SvgPicture.asset(
        imagePath,
      ),
    );
  }
}
