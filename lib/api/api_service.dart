import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    // String url = "https://reqres.in/api/login";
    // https://wero.fit/dev/api/login_api.php

    final response = await http.post(
        Uri.parse("http://13.234.59.19/btl/API/loginApi.php"),
        body: requestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
      print(response.body);
    } else {
      print('error');
      throw Exception('Failed to load data!');
    }
  }
}
