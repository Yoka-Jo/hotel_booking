class Constants {
  static const String baseUrl = "http://192.168.1.5:3000/api";
  static const String loginPath = "/auth/login";
  static const String signUpPath = "/auth/register";
  static const String getAllHotelsPath = "/hotels";
  static const String changeHotelFavStatePath =
      "/users/changeHotelFavState/{userId}/{hotelId}";
  static const String getFavouriteHotelsPath =
      "/users/getFavouriteHotels/{userId}";
  static const String searchForHotels = "/hotels/search";
  static const int apiTimeOut = 60 * 1000;
  static const numberOfHotelsToGet = 100;
  static const int durationOfChangeLanguage = 500;
}
