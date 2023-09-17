import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/provider/selectTabProvider.dart';

import '../shared/app_colors.dart';
import '../views/drawer/hotKeshAdd.dart';

class FloatWidget extends StatefulWidget {
  const FloatWidget({Key? key}) : super(key: key);

  @override
  _FloatWidgetState createState() => _FloatWidgetState();
}

class _FloatWidgetState extends State<FloatWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: AppColors.red1,
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ) /*Image.asset('assets/img/iconCenter.png'),*/
            ),
        onPressed: () {
          Provider.of<SelectTabProvider>(context, listen: false)
              .toggleSelect(HotKeshAdd() /*QR_Page()*/, 5);
        });
  }
}
