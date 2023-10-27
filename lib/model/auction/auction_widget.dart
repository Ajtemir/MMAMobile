import 'package:flutter/material.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';
import 'package:upai_app/model/auction/auction_state.dart';

import 'states/buyer_apply_widget.dart';

class AuctionWidget extends StatefulWidget {
  final AuctionState state;
  final AuctionDetailModel auctionDetail;
  const AuctionWidget({Key? key, required this.state, required this.auctionDetail}) : super(key: key);

  @override
  State<AuctionWidget> createState(){
    return BuyerApplyWidget(auctionDetail);
    switch(state){
      case AuctionState.buyerApply:

      case AuctionState.sellerMadeAuction:
        // TODO: Handle this case.
        break;
      case AuctionState.sellerUnmadeAuction:
        // TODO: Handle this case.
        break;
      case AuctionState.buyerUnapply:
        // TODO: Handle this case.
        break;
      case AuctionState.notMadeAuctioned:
        // TODO: Handle this case.
        break;
    }
  }
}



