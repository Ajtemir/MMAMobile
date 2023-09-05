import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../auth/server/service.dart';
import 'package:http/http.dart' as http;

import '../profileUsers/profileUsers.dart';

class MarketMap extends StatefulWidget {
  final int marketId;
  final LatLng marketPoint;
  const MarketMap({Key? key, required this.marketId, required this.marketPoint}) : super(key: key);



  @override
  State<MarketMap> createState() => _MarketMapState();
}

class _MarketMapState extends State<MarketMap> {
  Future<List<MarketShopDto>> _fetch(int marketId) async {
    var uri = Uri(
        host: AuthClient.ip,
        scheme: 'http',
        port: 80,
        path: 'Market/GetShopsByMarketId',
        queryParameters: {
          'marketId': marketId
        }
    );
    var response = await http.Client().get(uri);
    var data = jsonDecode(response.body)['data'];
    List<MarketShopDto> result = data.map<MarketShopDto>((x) {
      var id = x['id'];
      var pointsData = data['points'];
      var points = pointsData.map<LatLng>((x){
        var lat = x['latitude'];
        var long = x['longitude'];
        return LatLng(lat, long);
      }).toList();
      return MarketShopDto(id, points);
    }).toList();
    return result;
  }

  @override
  void initState() {
    super.initState();
  }
  final Completer<GoogleMapController> _controller = Completer();
  final _bounds = LatLngBounds(northeast: LatLng(42.86612099748323, 74.57394708836233),southwest: LatLng(42.86363603417931, 74.56925858682715));
  late CameraPosition marketPosition = CameraPosition(
    target: widget.marketPoint,
    zoom: 18,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MarketShopDto>>(
        future: _fetch(widget.marketId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return GoogleMap(
              initialCameraPosition: marketPosition,
              polygons: snapshot.data!.map((e) {
                return Polygon(
                  polygonId: PolygonId(e.id.toString()),
                  points: e.points,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            Center(child: Text(e.id.toString())),
                      ),
                    );
                  },
                );
              }).toSet(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
  @override
  Widget builds(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map Sample'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          GoogleMap(
            minMaxZoomPreference: MinMaxZoomPreference(18, 30),
            onTap: (options){
              print(options.latitude);
              print(options.longitude);
            },
            onCameraMove: (CameraPosition cameraPosition) async {

              var controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newLatLngBounds(
                  _bounds,
                  1));
              print(cameraPosition.zoom);
              print(cameraPosition.target);
            },
            mapType: MapType.normal,
            initialCameraPosition: marketPosition,
            cameraTargetBounds: CameraTargetBounds( LatLngBounds(southwest: LatLng(42.86373236767417, 74.57001765206697), northeast: LatLng(42.865295308753495, 74.57294662431123))),
            onMapCreated: (GoogleMapController controller) {
              // Future.delayed(
              //     Duration(milliseconds: 200),
              //         () => controller.animateCamera(CameraUpdate.newLatLngBounds(
              //             _bounds,
              //         1)));
              _controller.complete(controller);
            },
            onCameraMoveStarted: () async {
              var controller = await _controller.future;
              var zoomLevel = await controller.getVisibleRegion();
              print(zoomLevel);
              controller.animateCamera(
                CameraUpdate.newLatLngBounds(
                  _bounds,
                  0,
                ),
              );
            },
            // cameraTargetBounds: CameraTargetBounds(_bounds),

          ),
        ],
      ),
    );
  }
}

class MarketShopDto{
  final int id;
  final List<LatLng> points;

  MarketShopDto(this.id, this.points);

}
