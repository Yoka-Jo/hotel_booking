class LoginRequest {
  final String email;
  final String password;
  LoginRequest({
    required this.email,
    required this.password,
  });
}

class SignUpRequest {
  final String userName;
  final String email;
  final String password;
  SignUpRequest({
    required this.userName,
    required this.email,
    required this.password,
  });
}

class HotelsRequest {
  final bool featured;
  final int minAmount;
  final int maxAmount;
  final int limit;
  HotelsRequest({
    required this.featured,
    required this.minAmount,
    required this.maxAmount,
    required this.limit,
  });
}

class ChangeHotelFavStateRequest {
  final String userId;
  final String hotelId;
  ChangeHotelFavStateRequest({
    required this.userId,
    required this.hotelId,
  });
}

class GetFavHotelsRequest {
  final String userId;
  GetFavHotelsRequest({
    required this.userId,
  });
}

class SearchForHotelsRequest {
  final String hotelName;
  SearchForHotelsRequest({
    required this.hotelName,
  });
}
