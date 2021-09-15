import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/departure.dart';
import 'package:flutter_case_study/models/response.dart';
import 'package:http/http.dart' as http;

class DepartureProviders with ChangeNotifier {
  List<DepartureModel> _departures = [];

  List<DepartureModel> get departures {
    return [..._departures];
  }

  Future<void> getDepartures() async {
    final url = Uri.parse(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/departureTimes");

    try {
      final response = await http.get(
        url,
      );

      final extractedData = json.decode(response.body);

      print("RESPONSE $extractedData");

      ResponseModel responseModel;

      responseModel = ResponseModel.fromJson(extractedData);

      if (responseModel.success!) {
        List<DepartureModel> temp = [];
        for (var i in responseModel.data) {
          temp.add(DepartureModel.fromJson(i));
        }
        _departures = temp;
        notifyListeners();
      } else {
        _departures = [];
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
}
