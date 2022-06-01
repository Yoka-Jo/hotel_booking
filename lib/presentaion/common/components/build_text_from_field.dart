import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hotel_booking/app/functions.dart';
import 'package:hotel_booking/presentaion/resources/language_manager.dart';
import '../../resources/colors_manager.dart';

class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.errorText,
    this.textInputType,
  }) : super(key: key);

  final String label;
  final String? errorText;
  final TextEditingController controller;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Directionality(
          textDirection: getTextDirection(context),
          child: TextFormField(
            controller: controller,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                ),
            keyboardType: textInputType,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              errorText: errorText,
            ),
          ),
        )
      ],
    );
  }
}
