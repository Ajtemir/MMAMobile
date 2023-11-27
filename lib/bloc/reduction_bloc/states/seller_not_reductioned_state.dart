import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:upai_app/bloc/reduction_bloc/reduction_bloc.dart';
import 'package:upai_app/bloc/reduction_bloc/reduction_event.dart';
import 'package:intl/src/intl/date_format.dart';

import '../../../shared/app_colors.dart';
import '../../../views/category/aboutMagaz.dart';
import '../reduction_detail_model.dart';
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
                      child: getForm(context),
                    ),
              );
            },
            child: Text(
              "Запустить тендер",
            ),
          ),
        ),
      ],
    );
  }


  Widget getForm(BuildContext context){
    final _formKey = GlobalKey<FormBuilderState>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Выставить обьявление на тендер',
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
              name: 'startPrice',
              enabled: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Стартовая цена', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: AppColors.red1,
              onPressed: () async {
                if (_formKey.currentState!.saveAndValidate()) {
                  Map<String, dynamic> keyValuePairs = _formKey.currentState!.value;
                  BlocProvider.of<ReductionBloc>(context).add(ReductionMakeEvent(ReductionDetailModel(
                    keyValuePairs['startDate'],
                    keyValuePairs['endDate'],
                    double.parse(keyValuePairs['startPrice']),
                  )));
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Опубликовать тендер',
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