import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getData({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Error at  Get Data. Status code: ${response.statusCode}');
    }
  }

  Future<dynamic> postData({
    required String url,
    @required dynamic body,
  }) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'Error at Post data. Status code: ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
  Future<dynamic> putData({
    required String url,
    @required dynamic body,
  }) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'Error at Post data. Status code: ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
