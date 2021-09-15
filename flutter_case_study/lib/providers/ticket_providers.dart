import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/response.dart';
import 'package:flutter_case_study/models/ticket.dart';
import 'package:http/http.dart' as http;

class TicketProviders with ChangeNotifier {
  TicketModel? _ticket;

  TicketModel get ticket {
    return _ticket!;
  }

  Future<void> getTicket(String userId) async {
    final url = Uri.parse(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/$userId/ticket");

    try {
      final response = await http.get(
        url,
      );

      final extractedData = json.decode(response.body);

      print("RESPONSE $extractedData");

      ResponseModel responseModel;

      responseModel = ResponseModel.fromJson(extractedData);

      if (responseModel.success!) {
        _ticket = TicketModel.fromJson(responseModel.data);
        notifyListeners();
      } else {
        _ticket = null;
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
}
