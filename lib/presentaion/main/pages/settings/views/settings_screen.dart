import 'package:flutter/material.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer_impl.dart';
import 'package:hotel_booking/presentaion/main/pages/settings/widgets/build_logout_button.dart';

import '../../../../resources/colors_manager.dart';
import '../helpers/dynamic_link_helper.dart';
import '../widgets/build_change_app_theme.dart';
import '../widgets/build_change_language.dart';
import '../widgets/build_share_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final DynamicLinkHelper _dynamicLinkHelper = DynamicLinkHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Uri>(
            future: _dynamicLinkHelper.createDynamicLink(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      const BuildChangeLanguae(),
                      const BuildChangeAppTheme(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      BuildShareButton(uri: snapshot.data),
                      const SizedBox(
                        height: 20.0,
                      ),
                      BuildLogoutButton(),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }
            }));
  }
}
