import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_create_product_state.dart';
import 'create_product_bloc.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);


  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateProductBloc>(
      create: (context) => CreateProductBloc(),
      child: BlocBuilder<CreateProductBloc, BaseCreateProductState>(
        builder: (context, state) {
          return state.build(context);
        },
      ),
    );
  }
}
