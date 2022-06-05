import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hotel_booking/app/functions.dart';
import 'package:hotel_booking/presentaion/resources/language_manager.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import '../../../../../app/app_prefs.dart';
import '../../../../../app/constants.dart';
import '../../../../../app/dependency_injection.dart';
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
    Future.delayed(Duration.zero, () {
      currentLang =
          _appPrefs.getAppLanguage(context) == LanguageType.english.getValue()
              ? LanguageType.english
              : LanguageType.arabic;
    });
  }

  final AppPreferences _appPrefs = instance<AppPreferences>();
  bool isExpanded = false;
  LanguageType currentLang = LanguageType.english;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:
          const Duration(milliseconds: Constants.durationOfChangeLanguage),
      height: isExpanded ? 110.0 : 50.0,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 15.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [buildExpandedWidget(), buildLanguageButtons()],
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLanguageButton(
              onPressed: () => changeLanguage(LanguageType.arabic),
              title: AppStrings.arabic.tr(),
              languageTyp: LanguageType.arabic,
            ),
            const SizedBox(
              width: 20.0,
            ),
            buildLanguageButton(
              onPressed: () => changeLanguage(LanguageType.english),
              title: AppStrings.english.tr(),
              languageTyp: LanguageType.english,
            ),
          ],
        ),
      );

  Widget buildLanguageButton(
          {required VoidCallback onPressed,
          required String title,
          required LanguageType languageTyp}) =>
      SizedBox(
        height: 50.0,
        child: OutlinedButton(
          onPressed: onPressed,
          style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
              backgroundColor: MaterialStateProperty.all<Color>(
                  currentLang == languageTyp
                      ? AppColors.primary
                      : Theme.of(context).backgroundColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),
      );

  Future<void> changeLanguage(LanguageType languageTyp) async {
    if (languageTyp.getValue() == _appPrefs.getAppLanguage(context)) {
      return;
    }
    await _appPrefs.changeAppLanguage(languageTyp);
    Phoenix.rebirth(context);
  }
}
