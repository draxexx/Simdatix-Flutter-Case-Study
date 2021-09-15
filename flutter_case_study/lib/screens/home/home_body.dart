import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/departure.dart';
import 'package:flutter_case_study/providers/departure_providers.dart';
import 'package:flutter_case_study/resources/constants.dart';
import 'package:flutter_case_study/resources/size_config.dart';
import 'package:flutter_case_study/widgets/ContentTextWidget.dart';
import 'package:flutter_case_study/widgets/RoundedImageWidget.dart';
import 'package:flutter_case_study/widgets/TitleTextWidget.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
              child: RoundedImageWidget(
                url:
                    "https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80",
              ),
            ),
            DepartureTimesWidget(),
          ],
        ),
      ),
    );
  }
}

class DepartureTimesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24, left: 16, bottom: 12),
            child: TitleTextWidget(
              text: "Departure Times",
            ),
          ),
          DepartureListWidget(),
        ],
      ),
    );
  }
}

class DepartureListWidget extends StatefulWidget {
  @override
  _DepartureListWidgetState createState() => _DepartureListWidgetState();
}

class _DepartureListWidgetState extends State<DepartureListWidget> {
  var _isLoading = true;
  var _isInit = true;

  List<DepartureModel> _departureList = [];

  String _daysOfWeek(DepartureModel model) {
    String temp = "";
    int count = 0;
    for (var i in model.daysOfWeek!) {
      temp += i + "${(model.daysOfWeek!.length - 1 == count) ? "" : " - "}";
      count++;
    }
    return temp;
  }

  Future<void> _getDepartures() async {
    Provider.of<DepartureProviders>(context, listen: false)
        .getDepartures()
        .then((value) {
      _departureList =
          Provider.of<DepartureProviders>(context, listen: false).departures;
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _getDepartures();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.4,
      padding: const EdgeInsets.all(16),
      color: white3,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (var i in _departureList)
                    DepartureListItem(
                      icon: i.tourType == "Night"
                          ? Icons.bedtime
                          : Icons.wb_sunny,
                      text: "${i.route} /  ${i.departureTime}-${i.arrivalTime}",
                      subText: _daysOfWeek(i),
                    ),
                ],
              ),
            ),
    );
  }
}

class DepartureListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subText;
  final bool? isLast;
  DepartureListItem({
    required this.icon,
    required this.text,
    required this.subText,
    this.isLast,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: lightRed,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentTextWidget(
                    text: text,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 4),
                  ContentTextWidget(
                    text: subText,
                  ),
                ],
              ),
            ],
          ),
          if (isLast == null)
            Divider(
              thickness: 1,
              color: grey,
            ),
        ],
      ),
    );
  }
}
