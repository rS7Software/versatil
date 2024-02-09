import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../api/environment.dart';
import '../models/response_api.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UsersProvider {

  String _url = Environment.API_DELIVERY;
  String _api = '/api/users';

  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  //Future<ResponseApi>?

  Future<ResponseApi> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {
        'Content-type': 'application/json'
      };

      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      final ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      if (kDebugMode) {
        print('[Error] $e');
      }
      final ResponseApi responseApi = ResponseApi.empty();
      return responseApi;
    }
  }

  Future<ResponseApi> login(String email, String password) async {
    try {
      Uri url = Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({
        'email': email,
        'password': password
      });
      Map<String, String> headers = {
        'Content-type': 'application/json'
      };

      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      final ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      if (kDebugMode) {
        print('[Error] $e');
      }
      final ResponseApi responseApi = ResponseApi.empty();
      return responseApi;
    }
  }
}