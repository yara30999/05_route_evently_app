class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class RegisterRequest {
  String userName;
  String email;
  String password;

  RegisterRequest(this.userName, this.email, this.password);
}

class AddEventRequest {
  int? categoryId;
  String? title;
  String? description;
  String? date;
  String? time;
  double? lat;
  double? lng;
  bool isLiked;

  AddEventRequest({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.lat,
    required this.lng,
    this.isLiked = false,
  });
}
