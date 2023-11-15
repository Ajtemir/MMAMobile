import 'package:upai_app/model/auction/auction_detail_model.dart';
import 'package:upai_app/model/auction/auction_state.dart';

class AuctionDetailWithStateModel{
  final AuctionDetailModel auctionDetail;
  final AuctionState state;

  AuctionDetailWithStateModel(this.auctionDetail, this.state);


  AuctionDetailWithStateModel.fromJson(Map<String, dynamic> json) :
        auctionDetail = AuctionDetailModel.fromJson(json['auctionDetail']),
        state = AuctionState.values[json['auctionState']];
}