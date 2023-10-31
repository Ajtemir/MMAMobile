import 'dart:convert';

import 'package:upai_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:upai_app/model/auction/auction_bloc/api/execute_result.dart';

class AuctionApi {
  static Future<void> makeAuctioned(int productId, String email) async {
    var url = Constants.addPathToBaseUrl('/Auction/MakeAuction');
    var response = await http.Client().post(url,body: jsonEncode({
        'productId': productId,
        'email': email,
    }), headers: {"Content-Type":"application/json","Accept":"*/*"});
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json);
    if(result.isBad){
      throw Exception(result.message);
    }
  }

  static Future<void> unmakeAuctioned(int productId, String email) async {
    var url = Constants.addPathToBaseUrl('/Auction/UnmakeAuction');
    var response = await http.Client().post(url,body: jsonEncode({
      'productId': productId,
      'email': email,
    }), headers: {"Content-Type":"application/json","Accept":"*/*"});
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json);
    if(result.isBad){
      throw Exception(result.message);
    }
  }
}



