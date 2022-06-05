import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/presentaion/resources/routes_manager.dart';

import '../state_renderer/state_renderer.dart';
import '../state_renderer/state_renderer_impl.dart';

class DynamicLinkHelper {
  Future<Uri> createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://hotelsbooking.page.link',
      link: Uri.parse('https://hotelsbooking.page.link.com'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.hotel_booking',
        minimumVersion: 1,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.example.hotelBooking',
        minimumVersion: '1',
        appStoreId: 'your_app_store_id',
      ),
    );
    var dynamicUrl = await parameters.buildShortLink();
    final Uri shortUrl = dynamicUrl.shortUrl;
    return shortUrl;
  }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData? data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;

      if (deepLink != null) {
        Navigator.of(context).popAndPushNamed(Routes.resetPasswordRoute);
      }
      FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        Navigator.of(context).popAndPushNamed(Routes.resetPasswordRoute);
      });
    } catch (e) {
      ErrorState(StateRendererType.popupErrorState, e.toString());
    }
  }
}
