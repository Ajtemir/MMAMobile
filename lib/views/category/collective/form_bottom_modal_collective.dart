import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import '../../../DTOs/collective_model/make_collective_post.dart';
import '../../../DTOs/seller_email_and_product_id.dart';
import '../../../shared/app_colors.dart';
import '../../../service/service.dart';

class FormBottomModalCollective extends StatefulWidget {
  const FormBottomModalCollective({Key? key, required this.dto})
      : super(key: key);
  final SellerEmailAndProductId dto;

  @override
  State<FormBottomModalCollective> createState() =>
      _FormBottomModalCollectiveState();
}

class _FormBottomModalCollectiveState extends State<FormBottomModalCollective> {
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
            Text(
              'Выставить обьявление на групповую скидку',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
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
              decoration: InputDecoration(
                labelText: "Дата начала",
                border: OutlineInputBorder(),
              ),
              name: 'startDate',
            ),
            SizedBox(
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
              decoration: InputDecoration(
                labelText: "Дата конца",
                border: OutlineInputBorder(),
              ),
              name: 'endDate',
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              name: 'collectivePrice',
              enabled: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Коллективная цена', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              validator: (value) {
                if (value == null || int.parse(value) < 2) {
                  return 'Please enter min 2';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Минимальное количество покупателей",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)))),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              name: 'minBuyerCount',
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: AppColors.red1,
              onPressed: () async {
                if (_formKey.currentState!.saveAndValidate()) {
                  var keyValuePairs = _formKey.currentState?.value;
                  if (keyValuePairs != null) {
                    var data = MakingCollectiveProduct(
                      startDate: keyValuePairs['startDate'],
                      endDate: keyValuePairs['endDate'],
                      collectivePrice:
                          double.parse(keyValuePairs['collectivePrice']),
                      minBuyerCount: int.parse(keyValuePairs['minBuyerCount']),
                      email: _dto.sellerEmail,
                      productId: _dto.productId,
                    );
                    try {
                      await AuthClient().makeCollective(data);
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
