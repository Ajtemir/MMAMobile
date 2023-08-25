import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../profileUsers/profileUsers.dart';

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
        return FlutterMap(
        options: MapOptions(
          center: LatLng(42.85511022984554, 74.60023220919794),
          zoom: 15.2,
        ),
        nonRotatedChildren: [
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () {},
              ),
            ],
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: snapshot.data!.map((e) => Marker(point: e.latLng, builder: (context) {
              return GestureDetector(
                onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  e.isMarket ? const Center(child: Text("Market"),) : ProfileUser(emailUser:e.email),
                      ),
                    );
                },
                child: Icon(Icons.home, color: e.isMarket ? Colors.red : Colors.blue,),
              );
            })).toList(),
            // [
            //   Marker(
            //     point: LatLng(42.86526601364874, 74.57076567819526),
            //     builder: (context) => const FlutterLogo(),
            //   ),
            // ],
          ),
        ],
      );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class ViewModel{
  final LatLng latLng;
  final int id;
  final bool isMarket;
  final String email;

  ViewModel(this.latLng, this.id, this.isMarket, this.email);
}
