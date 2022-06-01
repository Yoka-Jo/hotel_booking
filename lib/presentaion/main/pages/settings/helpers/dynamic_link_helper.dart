import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

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
}
