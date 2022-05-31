import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hotel_booking/app/app_prefs.dart';

import '../../../../app/dependency_injection.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AppPreferences _appPrefs = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: changeLanguage,
            child: const Text("Change Language"),
          ),
          ElevatedButton(
            onPressed: changeTheme,
            child: const Text("Change Theme"),
          )
        ],
      ),
    ));
  }

  Future<void> changeLanguage() async {
    await _appPrefs.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  Future<void> changeTheme() async {
    await _appPrefs.changeAppTheme();
    Phoenix.rebirth(context);
  }
}
