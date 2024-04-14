import 'package:flutter/material.dart';
import 'package:upai_app/utilities/app_http_client.dart';

class UpdateProductProperties extends StatefulWidget {
  final int productId;
  const UpdateProductProperties({Key? key, required this.productId}) : super(key: key);


  @override
  State<UpdateProductProperties> createState() => _UpdateProductPropertiesState();
}

class _UpdateProductPropertiesState extends State<UpdateProductProperties> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AppHttpClient.execute(HttpMethod.get, '/Products/GetProductPropertiesByProductId', {'productId':widget.productId.toString()}),
        builder: (context, snapshot) {
            return Container();
   });
  }
}
