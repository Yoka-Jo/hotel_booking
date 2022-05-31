import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.primary,
      thickness: 1.0,
    );
  }
}
