class TicketModel {
  String? _passengerName;
  String? _seatNu;
  String? _departureCity;
  String? _departureBusStop;
  String? _departureTime;
  String? _arrivalCity;
  String? _arrivalBusStop;
  String? _arrivalTime;
  String? _tourNumber;
  String? _date;
  String? _ticketNumber;
  String? _bookingNumber;
  String? _qrCode;

  TicketModel({
    String? passengerName,
    String? seatNu,
    String? departureCity,
    String? departureBusStop,
    String? departureTime,
    String? arrivalCity,
    String? arrivalBusStop,
    String? arrivalTime,
    String? tourNumber,
    String? date,
    String? ticketNumber,
    String? bookingNumber,
    String? qrCode,
  }) {
    _passengerName = passengerName;
    _seatNu = seatNu;
    _departureCity = departureCity;
    _departureBusStop = departureBusStop;
    _departureTime = departureTime;
    _arrivalCity = arrivalCity;
    _arrivalBusStop = arrivalBusStop;
    _arrivalTime = arrivalTime;
    _tourNumber = tourNumber;
    _date = date;
    _ticketNumber = ticketNumber;
    _bookingNumber = bookingNumber;
    _qrCode = qrCode;
  }

  TicketModel.fromJson(dynamic json) {
    _passengerName = json["passengerName"];
    _seatNu = json["seatNu"];
    _departureCity = json["departureCity"];
    _departureBusStop = json["departureBusStop"];
    _departureTime = json["departureTime"];
    _arrivalCity = json["arrivalCity"];
    _arrivalBusStop = json["arrivalBusStop"];
    _arrivalTime = json["arrivalTime"];
    _tourNumber = json["tourNumber"];
    _date = json["date"];
    _ticketNumber = json["ticketNumber"];
    _bookingNumber = json["bookingNumber"];
    _qrCode = json["qrCode"];
  }

  String? get passengerName => _passengerName;

  String? get seatNu => _seatNu;

  String? get departureCity => _departureCity;

  String? get departureBusStop => _departureBusStop;

  String? get departureTime => _departureTime;

  String? get arrivalCity => _arrivalCity;

  String? get arrivalBusStop => _arrivalBusStop;

  String? get arrivalTime => _arrivalTime;

  String? get tourNumber => _tourNumber;

  String? get date => _date;

  String? get ticketNumber => _ticketNumber;

  String? get bookingNumber => _bookingNumber;

  String? get qrCode => _qrCode;
}
