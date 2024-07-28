import 'package:flutter/material.dart';

class Passvisibilityprovider extends ChangeNotifier {
  bool isPasswordvisible=false;
  void togglePassword(){
    isPasswordvisible=!isPasswordvisible;
    notifyListeners();
  }
}