import 'dart:convert';

import 'package:location/location.dart' as loc;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../service/service.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/appBar2.dart';
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

  late CameraPosition marketPosition = CameraPosition(
    target: widget.marketPoint,
    zoom: 18,
  );

  Future<LatLng> getMyCoordsLocator() async {
    loc.LocationData? data = await AuthClient.getLocation();
    LatLng _latLng;
    if (data != null) {
      _latLng = LatLng(data.latitude!, data.longitude!);
    } else {
      _latLng = LatLng(55.749711, 37.616806);
    }
    return _latLng;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMyCoordsLocator(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        initialCameraPosition: marketPosition,
                        polygons: [
                          ...snapshot.data!.map((e) {
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
                          }).toList(),
                          Polygon(
                            polygonId: PolygonId("21"),
                            points: [
                              LatLng(42.865597079606864, 74.57170878381608),
                              LatLng(42.86552630611915, 74.57174097032365),
                              LatLng(42.86551057866644, 74.57166989178609),
                              LatLng(42.86558184365456, 74.57164038748749),
                            ],
                            fillColor: Colors.blue,
                            strokeColor: Colors.red,
                            strokeWidth: 1,
                          ),
                          Polygon(
                            polygonId: PolygonId("22"),
                            points: [
                              LatLng(42.86560815238309, 74.57162670199095),
                              LatLng(42.86550979033042, 74.57167068345906),
                              LatLng(42.86549243230485, 74.57158948690255),
                              LatLng(42.86558914124227, 74.57154663316439),
                            ],
                            fillColor: Colors.blue,
                            strokeColor: Colors.red,
                            strokeWidth: 1,
                          ),
                          Polygon(
                            polygonId: PolygonId("23"),
                            points: [
                              LatLng(42.86557591609737, 74.57149024666683),
                              LatLng(42.86547838056631, 74.57153197267502),
                              LatLng(42.86546267567826, 74.57146092568807),
                              LatLng(42.86556103780599, 74.57141919967987),
                            ],
                            fillColor: Colors.blue,
                            strokeColor: Colors.red,
                            strokeWidth: 1,
                          ),
                          Polygon(
                            polygonId: PolygonId("23"),
                            points: [
                              LatLng(42.86556801888772, 74.57141347245273),
                              LatLng(42.86546236949163, 74.57146088765641),
                              LatLng(42.86542553117286, 74.57130536578835),
                              LatLng(42.86553257075525, 74.57125700228059),
                            ],
                            fillColor: Colors.blue,
                            strokeColor: Colors.red,
                            strokeWidth: 1,
                          ),
                          Polygon(
                            polygonId: PolygonId("23"),
                            points: [
                              LatLng(42.86554299667868, 74.57125131245614),
                              LatLng(42.86541093485178, 74.57130441748426),
                              LatLng(42.8653754866291, 74.57113751596731),
                              LatLng(42.865480441111686, 74.57109294567586),
                              LatLng(42.86549295223015, 74.57114415409582),
                              LatLng(42.86551797445948, 74.57113467105509),
                            ],
                            fillColor: Colors.blue,
                            strokeColor: Colors.red,
                            strokeWidth: 1,
                          ),
                          Polygon(
                            polygonId: PolygonId("23"),
                            points: [
                              LatLng(42.86536853599482, 74.57111191175731),
                              LatLng(42.86547488061379, 74.57109389397993),
                              LatLng(42.86546028430438, 74.57094121702409),
                              LatLng(42.86535324459664, 74.57095828649739),
                            ],
                            fillColor: Colors.blue,
                            strokeColor: Colors.red,
                            strokeWidth: 1,
                          ),
                        ].toSet(),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                });
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Ошибка с подключением'),
            );
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
