import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import '../state_renderer/state_renderer.dart';
import '../state_renderer/state_renderer_impl.dart';

class DynamicLinkHelper {
  Future<Uri> createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://hote1booking.page.link',
      link: Uri.parse('https://hote1booking.page.link.com'),
      androidParameters: const AndroidParameters(
        packageName: 'com.yoka.hotel_booking',
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.example.hotelBooking',
        minimumVersion: '1',
        appStoreId: 'your_app_store_id',
      ),
    );
    var shortLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    final Uri shortUrl = shortLink.shortUrl;
    log(shortUrl.path);
    return shortUrl;
  }

  Future<void> retrieveDynamicLink(BuildContext context,
      {required VoidCallback onChangePassword}) async {
    try {
      final PendingDynamicLinkData? data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;
      log("This is the dynamic link: ${deepLink.toString()}");

      if (deepLink != null) {
        onChangePassword();
        return;
      }
    } catch (e) {
      ErrorState(StateRendererType.popupErrorState, e.toString());
    }
  }
}
