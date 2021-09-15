import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_case_study/models/login.dart';
import 'package:flutter_case_study/models/response.dart';
import 'package:http/http.dart' as http;

class LoginProviders with ChangeNotifier {
  Future<ResponseModel> login(LoginModel model) async {
    final url = Uri.parse(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/login");

    try {
      final response = await http.post(
        url,
        body: model.toJson(),
      );

      final extractedData = json.decode(response.body);

      print("RESPONSE $extractedData");

      ResponseModel responseModel;

      responseModel = ResponseModel.fromJson(extractedData);

      return responseModel;
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
}
