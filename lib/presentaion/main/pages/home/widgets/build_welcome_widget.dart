import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/app/functions.dart';

import '../../../../resources/strings_manager.dart';
import '../../../cubit/main_cubit.dart';

class BuildWelcomWidget extends StatelessWidget {
  const BuildWelcomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${AppStrings.hello.tr()} ${MainCubit.get(context).userData["userName"]}",
      style: Theme.of(context).textTheme.titleMedium,
      textDirection: getTextDirection(context),
    );
  }
}
