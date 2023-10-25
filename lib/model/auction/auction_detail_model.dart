import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';
import '../../widgets/date_format.dart';

class AuctionDetailModel{
    final DateTime startDate;
    final DateTime endDate;
    final double startPrice;
    late final double? currentMaxPrice;

  AuctionDetailModel(this.startDate, this.endDate, this.startPrice, {this.currentMaxPrice});

  List<Widget> get widgets => [
    Text(startDate.toString()),
    Text(endDate.toString()),
    Text(currentMaxPrice.toString()),
    Text(startPrice.toString())];

  Widget get widget => Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.transparent),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              offset: Offset(12, 10),
              blurRadius: 30,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              Icons.add_business_rounded,
              color: Colors.white,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Начало',
                        style: styleTitleInCard,
                      ),
                      SizedBox(height: 5),
                      Text(
                        dateFormat(startDate),
                        style: styleSubtitleInCard,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Конец',
                        style: styleTitleInCard,
                      ),
                      SizedBox(height: 5),
                      Text(
                        dateFormat(endDate),
                        style: styleSubtitleInCard,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Начальная цена товара:',
                    style: styleTitleInCard,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${startPrice} сом',
                    style: styleSubtitleInCard,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Нынешняя максимальная цена:',
                    style: styleTitleInCard,
                  ),
                ),
                Expanded(
                  child: Text(
                    currentMaxPrice == null
                        ? "Нет покупателей"
                        : '${currentMaxPrice} сом',
                    style: styleSubtitleInCard,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  TextStyle styleTitleInCard =
    const TextStyle(color: AppColors.black, fontSize: 16);

    TextStyle styleSubtitleInCard =
    const TextStyle(color: AppColors.red1, fontSize: 14);

  AuctionDetailModel.fromJson(Map<String, dynamic> json) :
      endDate =DateTime.parse(json['endDate']),
      currentMaxPrice = json['currentMaxPrice'],
      startDate = DateTime.parse(json['startDate']),
      startPrice = json['startPrice'];

}