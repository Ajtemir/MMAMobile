import 'package:flutter/cupertino.dart';

class SelectCatProvider extends ChangeNotifier{
  String category='';
  String email='';
  void setEmail(String tempEmail){
    email=tempEmail;
  }
  void toggleSelect(String cat){
    category=cat;
    notifyListeners();
  }
}