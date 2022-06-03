class Constants {
  static const String baseUrl = "https://yoka-hotel-booking.herokuapp.com/api";
  static const String loginPath = "/auth/login";
  static const String signUpPath = "/auth/register";
  static const String getAllHotelsPath = "/hotels";
  static const String changeHotelFavStatePath =
      "/users/changeHotelFavState/{userId}/{hotelId}";
  static const String getFavouriteHotelsPath =
      "/users/getFavouriteHotels/{userId}";
  static const String searchForHotels = "/hotels/search";
  static const int apiTimeOut = 60 * 1000;
  static const numberOfHotelsToGet = 1000;
  static const int durationOfChangeLanguage = 500;
}
