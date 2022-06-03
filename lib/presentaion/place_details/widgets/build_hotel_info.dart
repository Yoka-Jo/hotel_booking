import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../resources/language_manager.dart';
import 'build_body_text.dart';
import 'build_title.dart';

class BuildHotelInfo extends StatelessWidget {
  const BuildHotelInfo({
    Key? key,
    required this.title,
    required this.bodyText,
    this.isStringEnglish = false,
  }) : super(key: key);

  final String title;
  final String bodyText;
  final bool isStringEnglish;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: isStringEnglish
                ? Alignment.centerLeft
                : context.locale == arabicLocal
                    ? Alignment.bottomRight
                    : Alignment.centerLeft,
            child: BuildTitle(title: title)),
        const SizedBox(
          height: 8.0,
        ),
        BuildBodyText(bodyText: bodyText),
      ],
    );
  }
}
