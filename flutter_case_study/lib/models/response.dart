class ResponseModel {
  int? _status;
  bool? _success;
  String? _message;
  dynamic _data;

  ResponseModel({
    int? status,
    bool? success,
    String? message,
    dynamic data,
  }) {
    _status = status;
    _success = success;
    _message = message;
    _data = data;
  }

  ResponseModel.fromJson(dynamic json) {
    _status = json["status"];
    _success = json["success"];
    _message = json["message"];
    _data = json["data"];
  }

  int? get status => _status;

  bool? get success => _success;

  String? get message => _message;

  dynamic get data => _data;
}
