import 'package:flutter/material.dart';
import 'package:upai_app/views/drawer/hotKeshAdd.dart';
import 'package:upai_app/views/pages/dashboard_web.dart';
import 'package:upai_app/views/pages/favorite.dart';
import 'package:upai_app/views/pages/profile/profile.dart';

import '../main/main_view.dart';

class HomeWebPage extends StatelessWidget {
  const HomeWebPage();

  @override
  Widget build(BuildContext context) {
    return MainView(
        pages: [DashboardWeb(), HotKeshAdd(), Favorite(), Profile()]);
  }
}
