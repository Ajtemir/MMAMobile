import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../shared/app_colors.dart';
import '../../../views/category/aboutMagaz.dart';
import 'base_reduction_state.dart';

class SellerNotReductionedState extends BaseReductionState {
  @override
  Widget build(context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(AppColors.red1),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 10)),
            ),
            onPressed: () {
              showMaterialModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)),
                ),
                builder: (contextInner) =>
                    SingleChildScrollView(
                      controller: ModalScrollController.of(
                          contextInner),
                      child: MakeAuctionedForm()
                          .getWidget(context),
                    ),
              );
            },
            child: Text(
              "Запустить аукцион",
            ),
          ),
        ),
      ],
    );
  }
}