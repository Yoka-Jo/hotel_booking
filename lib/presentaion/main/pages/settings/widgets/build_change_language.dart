import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/app/functions.dart';
import 'package:hotel_booking/presentaion/resources/localization/cubit/change_language_cubit.dart';
import 'package:hotel_booking/presentaion/resources/localization/language_manager.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import '../../../../../app/constants.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/strings_manager.dart';

class BuildChangeLanguae extends StatefulWidget {
  const BuildChangeLanguae({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildChangeLanguae> createState() => _BuildChangeLanguaeState();
}

class _BuildChangeLanguaeState extends State<BuildChangeLanguae>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration:
            const Duration(milliseconds: Constants.durationOfChangeLanguage));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  bool isExpanded = false;
  LanguageType currentLang = LanguageType.english;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:
          const Duration(milliseconds: Constants.durationOfChangeLanguage),
      height: isExpanded ? 110.0 : 50.0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildExpandedWidget(),
            buildLanguageButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildExpandedWidget() => Row(
        children: [
          Text(
            AppStrings.changeLanguage.tr(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Spacer(),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(
                (getTextDirection(context) == ui.TextDirection.ltr
                    ? 0
                    : math.pi)),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
                if (isExpanded) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
                size: 30.0,
              ),
            ),
          ),
        ],
      );

  Widget buildLanguageButtons() => FadeTransition(
        opacity: _animation,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buildLanguageButton(
                  onPressed: () => changeLanguage(LanguageType.arabic),
                  title: AppStrings.arabic.tr(),
                  languageLocale: arabicLocal,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: buildLanguageButton(
                  onPressed: () => changeLanguage(LanguageType.english),
                  title: AppStrings.english.tr(),
                  languageLocale: englishLocal,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildLanguageButton(
          {required VoidCallback onPressed,
          required String title,
          required Locale languageLocale}) =>
      SizedBox(
        height: 50.0,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              isExpanded = false;
            });
            _animationController.reverse().then((value) => onPressed());
          },
          style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
              backgroundColor: MaterialStateProperty.all<Color>(
                  context.locale == languageLocale
                      ? AppColors.primary
                      // ignore: deprecated_member_use
                      : Theme.of(context).backgroundColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ),
      );

  Future<void> changeLanguage(LanguageType languageTyp) async {
    ChangeLanguageCubit.get(context)
        .changeLanguage(isEnglish: languageTyp == LanguageType.english)
        .then((value) => context.setLocale(value));
  }
}
