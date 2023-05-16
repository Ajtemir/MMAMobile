import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCatProvider extends ChangeNotifier{
  String category='';
  String categoryId='';
  String email='zero@example.com';
  SharedPreferences? prefManager;

  void setEmail(String tempEmail) async{
    email=tempEmail;
    prefManager = await SharedPreferences.getInstance();
  }
  void toggleSelect(String cat,String catId){
    category=cat;
    categoryId=catId;
    notifyListeners();
  }
}