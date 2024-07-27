import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest_newsapp/secrets/secrets.dart';
class NewsProvider extends ChangeNotifier {
    bool isLoading = false;
    String error='';
    void fetchNews(String city)async {
      isLoading=true;
      error="";
      try {
        final response= await http.get(Uri.parse('${Secrets.baseUrl}${Secrets.countryUrl}in${Secrets.apikeyUrl}${Secrets.key}'));
      } catch (e) {
        
      }
    }
}