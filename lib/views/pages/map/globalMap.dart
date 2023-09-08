import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../profileUsers/profileUsers.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'marketMap.dart';

class GlobalMap extends StatefulWidget {
  const GlobalMap({Key? key}) : super(key: key);


  @override
  State<GlobalMap> createState() => _GlobalMapState();
}

class _GlobalMapState extends State<GlobalMap> {

  late List<LatLng> _list;



  @override
  void initState() {
  }

  Future<List<ShopViewModel>> _fetch() async {
    var response = await http.Client().get(Uri(
      host: AuthClient.ip,
      scheme: 'http',
      port: 80,
      path: 'Shops/GetShopsAndMarkets',
    ));
    var data = jsonDecode(response.body)['data'];
    List<ShopViewModel> result = data.map<ShopViewModel>((x) {
       var lat = x['latitude'];
       var long = x['longitude'];
       var isMarket = x['isMarket'];
       var id = x['id'];
       var email = x['email'];
       var shopType = x['shopType'];
       var latLng = LatLng(lat, long);
      return ShopViewModel(latLng, id, isMarket, email, shopType);
    }).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<ShopViewModel>>(future: _fetch(), builder: (ctx, snapshot) {
      if(snapshot.hasError){
        return Text('${snapshot.error}');
      }
      else if(snapshot.hasData) {
        return MapSample(shops: snapshot.data!,);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class MapSample extends StatefulWidget {
  final List<ShopViewModel> shops;
  const MapSample({Key? key, required this.shops}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late List<ShopViewModel> _shops;
  final InMapShopType _inMapShopType = InMapShopType();
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _london = CameraPosition(
    target: LatLng(42.86461810693966, 74.57107949918931),
    zoom: 18,
  );
  MapType _currentMapType = MapType.normal;

  late Map<int, BitmapDescriptor> typesIcons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _shops = widget.shops;
  }
  void _onMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  getIcons() async {
    var free = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        "assets/shopType/free.png");
    var fixed = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        "assets/shopType/fixed.png");
    var market = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        "assets/shopType/market.png");
    setState(() {
      typesIcons = {
        ShopType.free : free,
        ShopType.fixed : fixed,
        ShopType.market : market,
      };
    });
  }

  void _updateMap() {
    var types = [
      _inMapShopType.market ? ShopType.market : null,
      _inMapShopType.fixed ? ShopType.fixed : null,
      _inMapShopType.free ? ShopType.free : null,
    ];
    _shops = widget.shops.where((element) => types.contains(element.shopType)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Карта'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onCameraMove: (CameraPosition cameraPosition) {
              print(cameraPosition.zoom);
              print(cameraPosition.target);
            },
            mapType: _currentMapType,
            initialCameraPosition: _london,
            markers: _shops
                .map(
                  (e) =>  Marker(
                    markerId: MarkerId(e.getMarkerId()),
                    position: e.latLng,
                    icon:  BitmapDescriptor.defaultMarkerWithHue(e.getIconColor()),
                    infoWindow: InfoWindow(title: e.getName(), ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  e.isMarket ? MarketMap(marketId: e.id,marketPoint: e.latLng) : ProfileUser(emailUser:e.email),
                        ),
                      );
                    },
                  ),
                )
                .toSet(),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.all(18),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: FloatingActionButton(
          //       onPressed: _onMapType,
          //       child: const Icon(Icons.map, size: 36),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  FloatingActionButton.extended(
                    label: const Text("БУТИК"),
                    backgroundColor: Colors.green,
                    onPressed: (){
                      setState(() {
                        _inMapShopType.updateFixed();
                        _updateMap();
                      });
                    },
                    icon: Checkbox(
                      value: _inMapShopType.fixed, onChanged: (bool? value) {  },
                    ),
                  ),
                  const SizedBox(height: 5,),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.amber,
                    label: const Text("ТЦ/БАЗАР"),
                    onPressed: (){
                      setState(() {
                        _inMapShopType.updateMarket();
                        _updateMap();
                      });
                    },
                    icon: Checkbox(
                      value: _inMapShopType.market, onChanged: (bool? value) {  },
                    ),
                  ),
                  const SizedBox(height: 5,),
                  FloatingActionButton.extended(
                    label: const Text("Стихийная"),
                    onPressed: (){
                      setState(() {
                        _inMapShopType.updateFree();
                        _updateMap();
                      });
                    },
                    icon: Checkbox(
                      value: _inMapShopType.free, onChanged: (bool? value) {  },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ShopViewModel{
  final LatLng latLng;
  final int id;
  final bool isMarket;
  final String email;
  final int shopType;

  ShopViewModel(this.latLng, this.id, this.isMarket, this.email, this.shopType);

  String getName(){
    switch(shopType){
      case ShopType.online:
        return "Онлайн магазин";
      case ShopType.fixed:
        return "Бутик";
      case ShopType.free:
        return "Стихийная торговля";
      case ShopType.market:
        return "Базар/ТЦ";
    }
    throw Exception('Не найден тип');
  }

  String getIconPath(){
    switch(shopType){
      case ShopType.online:
        throw Exception('Не найден тип для ONLINE');
      case ShopType.fixed:
        return "assets/shopType/fixed.png";
      case ShopType.free:
        return "assets/shopType/free.png";
      case ShopType.market:
        return "assets/shopType/market.png";
    }
    throw Exception('Не найден тип');
  }

  double getIconColor(){
    switch(shopType){
      case ShopType.online:
        return BitmapDescriptor.hueMagenta;
      case ShopType.fixed:
        return BitmapDescriptor.hueBlue;
      case ShopType.free:
        return BitmapDescriptor.hueGreen;
      case ShopType.market:
        return BitmapDescriptor.hueOrange;
    }
    throw Exception('Не найден тип');
  }

  String getMarkerId() => id.toString() + isMarket.toString();

  MarkerId getMarketIdObj() => MarkerId(getMarkerId());
}

class ShopType{
  static const online = 1;
  static const fixed = 2;
  static const free = 3;
  static const market = 4;
}

class InMapShopType {
  bool fixed = true;
  bool free = true;
  bool market = true;

  void updateMarket(){
    market = !market;
  }

  void updateFixed(){
    fixed = !fixed;
  }

  void updateFree(){
    free = !free;
  }
}
