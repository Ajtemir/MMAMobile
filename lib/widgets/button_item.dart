import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onTap(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.red1,
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
