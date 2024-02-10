
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/shared/app_theme.dart';

import 'package:upai_app/views/pages/map/globalMap.dart';
import 'package:upai_app/views/pages/map/marketMap.dart';
import 'package:upai_app/views/splash_page/splash_page.dart';
import 'package:upai_app/provider/selectCatProvider.dart';
import 'package:upai_app/provider/selectTabProvider.dart';

import 'bloc/create_product_bloc/create_product_page.dart';
import 'views/auth/sing_in/sing_in_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main(){
runApp(  Upai());
}

class Upai extends StatelessWidget {
  const Upai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>SelectCatProvider()),
        ChangeNotifierProvider(create: (_)=>SelectTabProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        // splitScreenMode: ,
        builder: (context,widget) => MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            //add this line
            ScreenUtil.registerToBuild(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: AppTheme.themeData,
          // home: const SplashPage(),
          routes: {
        '/': (context) => SplashPage(),
        '/create-product': (context) => CreateProductPage(),
            '/login': (context) => SingInScreen(),
        },
        ),
      ),
    );
  }
}
