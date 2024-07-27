import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest_newsapp/model/newsmodel.dart';
import 'package:machinetest_newsapp/secrets/secrets.dart';

class NewsProvider extends ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;
  String error = '';
  String? code;
  void fetchNews(String city) async {
    isLoading = true;
    error = "";
    try {
      final response = await http.get(Uri.parse(
          '${Secrets.baseUrl}${Secrets.countryUrl}in${Secrets.apikeyUrl}${Secrets.key}'));
      print(response.body);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        newsModel = NewsModel.fromJson(data);
        notifyListeners();
        print('success');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getCountryCodeFromIp() async {
    isLoading = true;
    error = '';
    try {
      final response = await http.get(Uri.parse('http://ip-api.com/json'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        code = data['countryCode'];
        print(code);
        notifyListeners();
      } else {
        error = 'Unknown';
        notifyListeners();
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
