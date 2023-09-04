import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../profileUsers/profileUsers.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _london = CameraPosition(
    target: LatLng(42.865513497725765, 74.57141543616046),
    bearing: 180,
    tilt: -12,
    // target: LatLng(42.865513497725765, 72),
    zoom: 20,
  );
  MapType _currentMapType = MapType.normal;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map Sample'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onCameraMove: (CameraPosition cameraPosition) {
              print(cameraPosition.zoom);
              print(cameraPosition.target);
            },
            // cameraTargetBounds: CameraTargetBounds(
            //   LatLngBounds(
            //     northeast: LatLng(42.86571142264788, 74.57179907838137),
            //     southwest: LatLng(42.86532128045534, 74.57091493803752),
            //   ),
            // ),
            mapType: _currentMapType,
            initialCameraPosition: _london,
            markers: _shops
                .map(
                  (e) =>  Marker(
                    markerId: MarkerId(e.id.toString() + e.isMarket.toString()),
                    position: e.latLng,
                    icon:  BitmapDescriptor.defaultMarkerWithHue(e.getIconColor()),
                    infoWindow: InfoWindow(title: e.getName(), ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  e.isMarket ? const Center(child: Text("Market"),) : ProfileUser(emailUser:e.email),
                        ),
                      );
                    },
                  ),
                )
                .toSet(),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              // Future.delayed(
              //     const Duration(milliseconds: 200),
              //     () => controller.animateCamera(CameraUpdate.newLatLngBounds(
              //         LatLngBounds(
              //           southwest: const LatLng(42.86529, 74.57090),
              //           northeast: const LatLng(42.86571, 74.57182),
              //         ),
              //         1)));
            },
            // minMaxZoomPreference: MinMaxZoomPreference(20, 30),
            polygons: {
              // Polygon(
              //   consumeTapEvents: true,
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => Text("dfgsd"),
              //       ),
              //     );
              //   },
              //   points: [
              //     LatLng(42.865657000085584, 74.57177484108497),
              //     LatLng(42.86552570110141, 74.57183223460117),
              //     LatLng(42.86551040411421, 74.57175918830782),
              //     LatLng(42.86563915363811, 74.57170353398907),
              //   ],
              //   polygonId: const PolygonId('1'),
              //   geodesic: false,
              //   fillColor: Colors.white,
              //   strokeColor: Colors.red,
              // ),
            },
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _onMapType,
                child: const Icon(Icons.map, size: 36),
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
}

class ShopType{
  static const online = 1;
  static const fixed = 2;
  static const free = 3;
  static const market = 4;
}
