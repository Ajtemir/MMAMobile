import 'dart:convert';

import 'package:upai_app/constants/constants.dart';
import 'package:http/http.dart' as http;

class AuctionApi {
  Future<void> MakeAuctioned() async {
    var url = Constants.addPathToBaseUrl('/Auction/MakeAuction');
    var response = await http.get(url);
    var json = jsonDecode(response.body);

    return
  }
}



