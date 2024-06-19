import 'package:flutter/material.dart';
import 'package:upai_app/constants/constants.dart';

import '../../../../model/responsive.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: !Responsive.isLargeMobile(context)
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: !Responsive.isLargeMobile(context)
                ? Image.asset(
                    'assets/img/logo.png',
                  )
                : Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                            /*Drawer(
                              child: SingleChildScrollView(
                                child: Container(
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                              ),
                            );*/
                          },
                          icon: const Icon(Icons.menu)),
                      const SizedBox(width: 140),
                      Image.asset(
                        'assets/img/logo.png',
                      ),
                    ],
                  ),
          ),
          // if(Responsive.isLargeMobile(context)) MenuButton(),
          const Spacer(
            flex: 2,
          ),
          if (!Responsive.isLargeMobile(context)) const NavigationButtonList(),
          const Spacer(
            flex: 2,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
