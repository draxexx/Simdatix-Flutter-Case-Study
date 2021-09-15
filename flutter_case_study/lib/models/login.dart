class LoginModel {
  String? _email;
  String? _password;

  LoginModel({
    String? email,
    String? password,
  }) {
    _email = email;
    _password = password;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["email"] = _email;
    map["password"] = _password;
    return map;
  }

  set email(String value) => _email = value;

  set password(String value) => _password = value;
}
