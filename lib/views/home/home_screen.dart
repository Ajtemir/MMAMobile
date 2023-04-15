import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:upai_app/provider/selectTabProvider.dart';
import 'package:upai_app/views/pages/favorite.dart';
import 'package:upai_app/views/pages/messeg.dart';
import 'package:upai_app/views/pages/notifications.dart';
import 'package:upai_app/views/pages/dashboard.dart';
import 'package:upai_app/views/pages/history.dart';
import 'package:upai_app/views/pages/profile/profile.dart';
import 'package:upai_app/widgets/floatingAction.dart';

import '../../shared/app_colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> screens = [
    Dashboard(),
    Favorite(),
    Messej(),
    Profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: Provider.of<SelectTabProvider>(context).currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        // notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(Dashboard(),
                          0); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.home_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 0
                      ? AppColors.red1
                      : AppColors.blue1,
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(Messej(),
                          2); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.message_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 2
                      ? AppColors.red1
                      : AppColors.blue1,
                ),
              ),
              SizedBox(),
              SizedBox(),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(Favorite(),
                          1); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 1
                      ? Color(0xFFFF6B00)
                      : Color(0xFF225196),
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(Profile(),
                          3); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.perm_identity_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 3
                      ? AppColors.red1
                      : AppColors.blue1,
                ),
              ),

              // Right Tab bar icons
            ],
          ),
        ),
      ),
    );
  }
}
