import 'package:flutter/cupertino.dart';
import 'package:upai_app/views/pages/dashboard.dart';

class SelectTabProvider extends ChangeNotifier {
  List<Widget> backList = [];
  List<int> tabList = [];
  int currentTab = 0;
  Widget currentScreen = Dashboard();
  void toggleSelect(Widget newWidget, int tab) {
    if (tab == 5) {
      backList.add(currentScreen);
      tabList.add(currentTab);
    }
    currentScreen = newWidget;
    currentTab = tab;
    notifyListeners();
  }

  void backFun() {
    currentScreen = backList.last;
    backList.removeLast();
    currentTab = tabList.last;
    tabList.removeLast();
    notifyListeners();
  }
}
