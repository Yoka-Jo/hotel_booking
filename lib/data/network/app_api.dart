import 'package:dio/dio.dart';
import 'package:hotel_booking/app/constants.dart';
import 'package:retrofit/http.dart';
import '../responses/responses.dart';
part "app_api.g.dart";

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST(Constants.loginPath)
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);

  @POST(Constants.signUpPath)
  Future<AuthenticationResponse> signUp(@Field("username") String userName,
      @Field("email") String email, @Field("password") String password);

  @POST(Constants.changeHotelFavStatePath)
  Future<ChangeHotelFavStateResponse> changeHotelFaveState(
      @Path("userId") String userId, @Path("hotelId") String hotelId);

  @GET(Constants.getAllHotelsPath)
  Future<HotelsReponse> getHotels(
      @Query("featured") bool featured,
      @Query("min") int minAmount,
      @Query("max") int maxAmount,
      @Query("limit") int limit);

  @GET(Constants.getFavouriteHotelsPath)
  Future<FavouriteHotelsResponse> getFavouriteHotels(
      @Path("userId") String userId);

  @GET(Constants.searchForHotels)
  Future<HotelsReponse> searchForHotels(@Query("hotelName") String query);

  @POST(Constants.forgotPasswordPath)
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
    @Field("link") String dynamicLink,
  );

  @POST(Constants.resetPasswordPath)
  Future<ResetPasswordResponse> resetPassword(
    @Path("id") String id,
    @Path("token") String token,
    @Field("password") String password,
  );
}
