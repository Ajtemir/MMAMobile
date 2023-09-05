import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarketMap extends StatefulWidget {
  final int marketId;
  const MarketMap({Key? key, required this.marketId}) : super(key: key);

  @override
  State<MarketMap> createState() => _MarketMapState();
}

class _MarketMapState extends State<MarketMap> {
  final Completer<GoogleMapController> _controller = Completer();
  final _bounds = LatLngBounds(northeast: LatLng(42.86612099748323, 74.57394708836233),southwest: LatLng(42.86363603417931, 74.56925858682715));
  static const CameraPosition _london = CameraPosition(
    target: LatLng(42.86461810693966, 74.57107949918931),
    zoom: 18,
  );
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
            initialCameraPosition: _london,
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
