class UserModel {
  String? _email;
  String? _userId;

  UserModel({
    String? email,
    String? userId,
  }) {
    _email = email;
    _userId = userId;
  }

  UserModel.fromJson(dynamic json) {
    _email = json["email"];
    _userId = json["userId"];
  }

  String? get email => _email;

  String? get userId => _userId;
}
