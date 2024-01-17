import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/bloc/create_product_bloc/base_create_product_state.dart';

import 'package:upai_app/provider/selectTabProvider.dart';
import 'package:upai_app/views/drawer/hotKeshAdd.dart';
import 'package:upai_app/views/pages/favorite.dart';
import 'package:upai_app/views/pages/messeg.dart';
import 'package:upai_app/views/pages/dashboard.dart';
import 'package:upai_app/views/pages/profile/profile.dart';

import '../../bloc/create_product_bloc/create_product_page.dart';
import '../../bloc/create_product_bloc/create_product_bloc.dart';
import '../../shared/app_colors.dart';
import '../pages/map/globalMap.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        tooltip: "Карта",
        onPressed: () {
          Provider.of<SelectTabProvider>(context, listen: false)
              .toggleSelect(const GlobalMap(), 4);
        },
        child: Icon(
          Icons.map_rounded,
          color: Provider.of<SelectTabProvider>(context).currentTab == 4
              ? AppColors.red1
              : AppColors.blue1,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(5),
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: MaterialButton(
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
            ),
            Flexible(
              child: MaterialButton(
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(CreateProductPage(),
                          2); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.add_to_photos_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 2
                      ? AppColors.red1
                      : AppColors.blue1,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Flexible(
              child: MaterialButton(
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
            ),
            Flexible(
              child: MaterialButton(
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
            ),

            // Right Tab bar icons
          ],
        ),
      ),
    );
  }
}
