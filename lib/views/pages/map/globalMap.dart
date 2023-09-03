import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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

  Future<List<ViewModel>> _fetch() async {
    var response = await http.Client().get(Uri(
      host: AuthClient.ip,
      scheme: 'http',
      port: 80,
      path: 'Shops/GetShopsAndMarkets',
    ));
    var data = jsonDecode(response.body)['data'];
    List<ViewModel> result = data.map<ViewModel>((x) {
       var lat = x['latitude'];
       var long = x['longitude'];
       var isMarket = x['isMarket'];
       var id = x['id'];
       var email = x['email'];
       var latLng = LatLng(lat, long);
      return ViewModel(latLng, id, isMarket, email);
    }).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<ViewModel>>(future: _fetch(), builder: (ctx, snapshot) {
      if(snapshot.hasError){
        return Text('${snapshot.error}');
      }
      else if(snapshot.hasData) {
        return MyApp();
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}


class ViewModel{
  final LatLng latLng;
  final int id;
  final bool isMarket;
  final String email;

  ViewModel(this.latLng, this.id, this.isMarket, this.email);
}
