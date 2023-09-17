import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import '../../../DTOs/auction_model/make_auction_post.dart';
import '../../../DTOs/seller_email_and_product_id.dart';
import '../../../shared/app_colors.dart';
import '../../../service/service.dart';

class FormBottomModalAuction extends StatefulWidget {
  const FormBottomModalAuction({Key? key, required this.dto}) : super(key: key);
  final SellerEmailAndProductId dto;

  @override
  State<FormBottomModalAuction> createState() => _FormBottomModalAuctionState();
}

class _FormBottomModalAuctionState extends State<FormBottomModalAuction> {
  final _formKey = GlobalKey<FormBuilderState>();
  late SellerEmailAndProductId _dto;
  @override
  void initState() {
    super.initState();
    _dto = widget.dto;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Выставить аукцион',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FormBuilderDateTimePicker(
              validator: (value) {
                if (value == null) {
                  return 'Please enter start Date';
                }
                return null;
              },
              currentDate: DateTime.now(),
              inputType: InputType.both,
              format: DateFormat("yyyy-MM-dd hh:mm"),
              initialDate: DateTime.now(),
              decoration: const InputDecoration(
                labelText: "Дата начала",
                border: OutlineInputBorder(),
              ),
              name: 'startDate',
            ),
            const SizedBox(
              height: 10,
            ),
            FormBuilderDateTimePicker(
              validator: (value) {
                if (value == null) {
                  return 'Please enter end Date';
                }
                return null;
              },
              inputType: InputType.both,
              format: DateFormat("yyyy-MM-dd hh:mm"),
              initialDate: DateTime.now(),
              decoration: const InputDecoration(
                labelText: "Дата конца",
                border: OutlineInputBorder(),
              ),
              name: 'endDate',
            ),
            const SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              name: 'startAuctionPrice',
              enabled: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Начальная цена',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: AppColors.red1,
              onPressed: () async {
                if (_formKey.currentState!.saveAndValidate()) {
                  var keyValuePairs = _formKey.currentState?.value;
                  if (keyValuePairs != null) {
                    var data = MakingAuctionProduct(
                      startDate: keyValuePairs['startDate'],
                      endDate: keyValuePairs['endDate'],
                      startAuctionPrice:
                          double.parse(keyValuePairs['startAuctionPrice']),
                      email: _dto.sellerEmail,
                      productId: _dto.productId,
                    );
                    try {
                      await AuthClient().makeAuction(data);
                      Navigator.pop(context);

                      _dto.update();
                    } catch (err) {
                      print(err.toString());
                    }
                  }
                }
              },
              child: const Text(
                'Опубликовать скидку',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
