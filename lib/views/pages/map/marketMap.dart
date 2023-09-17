import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../../widgets/appBar.dart';
import '../../auth/server/service.dart';
import 'package:http/http.dart' as http;

import '../profileUsers/profileUsers.dart';

class MarketMap extends StatefulWidget {
  final int marketId;
  final LatLng marketPoint;
  const MarketMap({Key? key, required this.marketId, required this.marketPoint})
      : super(key: key);

  @override
  State<MarketMap> createState() => _MarketMapState();
}

class _MarketMapState extends State<MarketMap> {
  Future<List<MarketShopDto>> _fetch(int marketId) async {
    Map<String, dynamic> queryParams = {'marketId': marketId.toString()};
    var uri = Uri(
        host: AuthClient.ip,
        scheme: 'http',
        port: 80,
        path: 'Market/GetShopsByMarketId',
        queryParameters: queryParams);
    var response = await http.Client().get(uri);
    var data = jsonDecode(response.body)['data'];
    List<MarketShopDto> result = data.map<MarketShopDto>((x) {
      var id = x['id'];
      var sellerEmail = x['sellerEmail'];
      var pointsData = x['points'];
      var points = pointsData.map<LatLng>((p) {
        var lat = p['latitude'];
        var long = p['longitude'];
        return LatLng(lat, long);
      }).toList();
      return MarketShopDto(id, points, sellerEmail);
    }).toList();
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  final Completer<GoogleMapController> _controller = Completer();
  final _bounds = LatLngBounds(
      northeast: LatLng(42.86612099748323, 74.57394708836233),
      southwest: LatLng(42.86363603417931, 74.56925858682715));
  late CameraPosition marketPosition = CameraPosition(
    target: widget.marketPoint,
    zoom: 19,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MarketShopDto>>(
        future: _fetch(widget.marketId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            print("Asan ///////////////");
            return Scaffold(
              appBar: AllAppBar2(),
              body: GoogleMap(
                circles: {
                  Circle(
                    circleId: CircleId("1"),
                    center: widget.marketPoint,
                    radius: 330,
                    strokeWidth: 2,
                    strokeColor: Colors.green,
                    fillColor: Colors.green.withOpacity(0.1)
                  )
                },
                initialCameraPosition: marketPosition,
                polygons: snapshot.data!.map((e) {
                  print(e.points.toString());
                  return Polygon(
                    consumeTapEvents: true,
                    fillColor: Colors.blue,
                    polygonId: PolygonId(e.id.toString()),
                    points: e.points,
                    strokeColor: Colors.red,
                    strokeWidth: 1,
                    onTap: () {
                      setState(() {});
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileUser(emailUser: e.sellerEmail),
                        ),
                      );
                    },
                  );
                }).toSet(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
  //
  // @override
  // Widget builds(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Google Map Sample'),
  //       backgroundColor: Colors.blue,
  //     ),
  //     body: Stack(
  //       children: [
  //         GoogleMap(
  //           minMaxZoomPreference: MinMaxZoomPreference(18, 30),
  //           onTap: (options) {},
  //           onCameraMove: (CameraPosition cameraPosition) async {
  //             var controller = await _controller.future;
  //             controller
  //                 .animateCamera(CameraUpdate.newLatLngBounds(_bounds, 1));
  //             print(cameraPosition.zoom);
  //             print(cameraPosition.target);
  //           },
  //           mapType: MapType.normal,
  //           initialCameraPosition: marketPosition,
  //           cameraTargetBounds: CameraTargetBounds(LatLngBounds(
  //               southwest: LatLng(42.86373236767417, 74.57001765206697),
  //               northeast: LatLng(42.865295308753495, 74.57294662431123))),
  //           onMapCreated: (GoogleMapController controller) {
  //             // Future.delayed(
  //             //     Duration(milliseconds: 200),
  //             //         () => controller.animateCamera(CameraUpdate.newLatLngBounds(
  //             //             _bounds,
  //             //         1)));
  //             _controller.complete(controller);
  //           },
  //           onCameraMoveStarted: () async {
  //             var controller = await _controller.future;
  //             var zoomLevel = await controller.getVisibleRegion();
  //             controller.animateCamera(
  //               CameraUpdate.newLatLngBounds(
  //                 _bounds,
  //                 0,
  //               ),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class MarketShopDto {
  final int id;
  final List<LatLng> points;
  final String sellerEmail;

  MarketShopDto(this.id, this.points, this.sellerEmail);
}
