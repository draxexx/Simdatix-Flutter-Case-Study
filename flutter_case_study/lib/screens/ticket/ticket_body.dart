import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/ticket.dart';
import 'package:flutter_case_study/providers/ticket_providers.dart';
import 'package:flutter_case_study/resources/constants.dart';
import 'package:flutter_case_study/resources/size_config.dart';
import 'package:flutter_case_study/screens/home/home_screen.dart';
import 'package:flutter_case_study/widgets/ContentTextWidget.dart';
import 'package:flutter_case_study/widgets/GradientCardWidget.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GradientCardWidget(
            child: TicketDetails(),
          ),
          Container(),
        ],
      ),
    );
  }
}

class TicketDetails extends StatefulWidget {
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  var _isLoading = true;
  var _isInit = true;

  TicketModel _ticketModel = new TicketModel();

  Future<void> _getTicket(String userId) async {
    Provider.of<TicketProviders>(context, listen: false)
        .getTicket(userId)
        .then((value) {
      _ticketModel =
          Provider.of<TicketProviders>(context, listen: false).ticket;
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _getTicket(HomeScreen.userId!);
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                TitleRow(
                  firstTitle: "Departure time",
                  secondTitle: "Arrival time",
                  firstTitleFontFamily: "WorkSans",
                  secondTitleFontFamily: "WorkSans",
                ),
                SizedBox(height: 12),
                ContentRow(
                  firstContent: _ticketModel.departureTime!,
                  secondContent: _ticketModel.arrivalTime!,
                  horizontalPadding: 5,
                  isSeat: false,
                ),
                SizedBox(height: 20),
                FlightTitleRow(
                  departureCity: _ticketModel.departureCity!,
                  arrivalCity: _ticketModel.arrivalCity!,
                ),
                SizedBox(height: 10),
                ContentRow(
                  firstContent: _ticketModel.departureBusStop!,
                  secondContent: _ticketModel.arrivalBusStop!,
                  fontSize: getProportionateScreenWidth(11),
                  fontWeight: FontWeight.normal,
                  color: black3,
                  isSeat: false,
                ),
                SizedBox(height: 20),
                TitleRow(
                  firstTitle: "Passenger",
                  secondTitle: "Seat",
                ),
                SizedBox(height: 10),
                ContentRow(
                  firstContent: _ticketModel.passengerName!,
                  secondContent: _ticketModel.seatNu!,
                  isSeat: true,
                ),
                SizedBox(height: 20),
                TitleRow(
                  firstTitle: "Tour Number",
                  secondTitle: "Date",
                  secondTitleFontFamily: "WorkSans",
                ),
                SizedBox(height: 10),
                ContentRow(
                  firstContent: _ticketModel.tourNumber!,
                  secondContent: _ticketModel.date!,
                  isSeat: false,
                ),
                SizedBox(height: 20),
                QrSection(
                  ticketNumber: _ticketModel.ticketNumber!,
                  bookingNumber: _ticketModel.bookingNumber!,
                  qrCode: _ticketModel.qrCode!,
                ),
              ],
            ),
    );
  }
}

class TitleRow extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final String? firstTitleFontFamily;
  final String? secondTitleFontFamily;
  TitleRow({
    required this.firstTitle,
    required this.secondTitle,
    this.firstTitleFontFamily,
    this.secondTitleFontFamily,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContentTextWidget(
            text: firstTitle,
            color: grey2,
            fontFamily: firstTitleFontFamily ?? "Roboto",
          ),
          ContentTextWidget(
            text: secondTitle,
            color: grey2,
            fontFamily: secondTitleFontFamily ?? "Roboto",
          ),
        ],
      ),
    );
  }
}

class ContentRow extends StatelessWidget {
  final String firstContent;
  final String secondContent;
  final double? horizontalPadding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool isSeat;
  ContentRow({
    required this.firstContent,
    required this.secondContent,
    this.horizontalPadding,
    this.fontSize,
    this.fontWeight,
    this.color,
    required this.isSeat,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContentTextWidget(
            text: firstContent,
            color: color ?? black2,
            fontWeight: fontWeight ?? FontWeight.w500,
            size: fontSize ?? getProportionateScreenWidth(15),
          ),
          isSeat
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: lightRed,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ContentTextWidget(
                    text: secondContent,
                    color: white2,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    size: fontSize ?? getProportionateScreenWidth(15),
                  ),
                )
              : ContentTextWidget(
                  text: secondContent,
                  color: color ?? black2,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  size: fontSize ?? getProportionateScreenWidth(15),
                ),
        ],
      ),
    );
  }
}

class FlightTitleRow extends StatelessWidget {
  final String departureCity;
  final String arrivalCity;
  FlightTitleRow({
    required this.departureCity,
    required this.arrivalCity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContentTextWidget(
            text: departureCity,
            color: lightRed,
            fontWeight: FontWeight.bold,
            size: 24,
          ),
          Container(
            child: Row(
              children: [
                ContentTextWidget(
                  text: "------",
                  color: lightRed,
                  fontWeight: FontWeight.w300,
                  size: getProportionateScreenWidth(23),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: lightRed,
                ),
                ContentTextWidget(
                  text: "------",
                  color: lightRed,
                  fontWeight: FontWeight.w300,
                  size: getProportionateScreenWidth(23),
                ),
              ],
            ),
          ),
          ContentTextWidget(
            text: arrivalCity,
            color: lightRed,
            fontWeight: FontWeight.bold,
            size: getProportionateScreenWidth(23),
          ),
        ],
      ),
    );
  }
}

class QrSection extends StatelessWidget {
  final String ticketNumber;
  final String bookingNumber;
  final String qrCode;
  QrSection({
    required this.ticketNumber,
    required this.bookingNumber,
    required this.qrCode,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentTextWidget(
                    text: "Ticket Number",
                    color: grey2,
                  ),
                  SizedBox(height: 8),
                  ContentTextWidget(
                    text: ticketNumber,
                    color: black2,
                    fontWeight: FontWeight.w500,
                    size: getProportionateScreenWidth(15),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentTextWidget(
                    text: "Booking Number",
                    color: grey2,
                  ),
                  SizedBox(height: 8),
                  ContentTextWidget(
                    text: bookingNumber,
                    color: black2,
                    fontWeight: FontWeight.w500,
                    size: getProportionateScreenWidth(15),
                  ),
                ],
              ),
            ],
          ),
          QrImage(
            data: qrCode,
            version: QrVersions.auto,
            size: getProportionateScreenWidth(88),
          ),
        ],
      ),
    );
  }
}
