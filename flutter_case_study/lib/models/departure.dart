class DepartureModel {
  String? _route;
  String? _departureTime;
  String? _arrivalTime;
  String? _tourType;
  List<String>? _daysOfWeek;

  DepartureModel({
    String? route,
    String? departureTime,
    String? arrivalTime,
    String? tourType,
    List<String>? daysOfWeek,
  }) {
    _route = route;
    _departureTime = departureTime;
    _arrivalTime = arrivalTime;
    _tourType = tourType;
    _daysOfWeek = daysOfWeek;
  }

  DepartureModel.fromJson(dynamic json) {
    _route = json["route"];
    _departureTime = json["departureTime"];
    _arrivalTime = json["arrivalTime"];
    _tourType = json["tourType"];
    _daysOfWeek = [];
    json["daysOfWeek"].forEach((v) {
      _daysOfWeek!.add(v);
    });
  }

  String? get route => _route;

  String? get departureTime => _departureTime;

  String? get arrivalTime => _arrivalTime;

  String? get tourType => _tourType;

  List<String>? get daysOfWeek => _daysOfWeek;
}
