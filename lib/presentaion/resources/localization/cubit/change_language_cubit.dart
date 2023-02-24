import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../language_manager.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  static ChangeLanguageCubit get(BuildContext context) =>
      BlocProvider.of(context);

  bool _isEnglish = true;

  Locale get getLocale => _isEnglish ? englishLocal : arabicLocal;

  Future<Locale> initLanguage() async {
    emit(ChangeLanguageInitial());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    log("This is what you looking for");
    log(prefs.getBool("lang").toString());
    final isEnglish = prefs.getBool("lang") ?? true;
    _isEnglish = isEnglish;
    emit(ChangeLanguage());
    return getLocale;
  }

  Future<Locale> changeLanguage({required bool isEnglish}) async {
    if (_isEnglish == isEnglish) return getLocale;
    emit(ChangeLanguageInitial());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("lang", isEnglish);
    _isEnglish = isEnglish;
    emit(ChangeLanguage());
    return getLocale;
  }
}
