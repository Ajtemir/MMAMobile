import 'dart:convert';

import 'package:upai_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:upai_app/model/auction/auction_bloc/api/execute_result.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';
import 'package:upai_app/model/auction/auction_detail_with_state_model.dart';

class AuctionApi {
  static Future<void> makeAuctioned(int productId, String email, AuctionDetailModel detail) async {
    var url = Constants.addPathToBaseUrl('/Auction/MakeAuction');
    var response = await http.Client().post(url,body: jsonEncode({
        'productId': productId,
        'email': email,
        "startDate": detail.startDate.toIso8601String(),
        "endDate": detail.endDate.toIso8601String(),
        "startPrice": detail.startPrice
    }), headers: {"Content-Type":"application/json","Accept":"*/*"});
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json);
    if(result.isBad){
      throw Exception(result.message);
    }
  }

  static Future<void> unmakeAuctioned(int productId, String email) async {
    var url = Constants.addPathToBaseUrl('/Auction/UnmakeAuction');
    var response = await http.Client().delete(url,body: jsonEncode({
      'productId': productId,
      'sellerEmail': email,
    }), headers: {"Content-Type":"application/json","Accept":"*/*"});
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json);
    if(result.isBad){
      throw Exception(result.message);
    }
  }

  static Future<void> applyAuctioned(int productId, String email, double suggestedPrice) async {
    var url = Constants.addPathToBaseUrl('/Auction/Apply');
    var response = await http.Client().post(url,body: jsonEncode({
      'productId': productId,
      'buyerEmail': email,
      'suggestedPrice': suggestedPrice
    }), headers: {"Content-Type":"application/json","Accept":"*/*"});
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json);
    if(result.isBad){
      throw Exception(result.message);
    }
  }

  static Future<AuctionDetailWithStateModel> getAuctionDetail(int productId, String email) async {
    var url = Constants.addPathToBaseUrl('/Auction/GetAuctionDetail',queryParameters: {'productId': productId.toString(), 'Email': email});
    var response = await http.Client().get(url);
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json, dataConstructor: AuctionDetailWithStateModel.fromJson);
    if(result.isBad){
      throw Exception(result.message);
    }
    return result.single!;
  }

  static Future<AuctionDetailWithStateModel?> submitAuction(int productId, String email) async {
    var url = Constants.addPathToBaseUrl('/Auction/SubmitAuction');
    var response = await http.Client().post(url,body: jsonEncode({'productId': productId, 'Email': email,}), headers: {"Content-Type":"application/json","Accept":"*/*"});
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json);
    if(result.isBad){
      throw Exception(result.message);
    }
    return result.single;
  }

}



