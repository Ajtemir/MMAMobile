import 'dart:convert';

class SubmitCollectiveArgument{
  final int productId;

  SubmitCollectiveArgument(this.productId);
  Map<String, dynamic> toMap(){
    return {
      'productId': productId,
    };
  }

  String toJson() => jsonEncode(toMap());

}