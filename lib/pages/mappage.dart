// ignore_for_file: prefer_const_constructors

import 'package:denizli/constants/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/location.dart';

class MapPage extends StatefulWidget {
  late Location location;

  MapPage({required this.location, Key? key}) : super(key: key);

  @override
  State<MapPage> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mapController.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    LatLng center = LatLng(widget.location.enlem, widget.location.boylam);
    Marker marker = Marker(
      markerId: MarkerId('marker1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: center
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Sabitler.ikinciRenk.shade900,
        title: Text('${widget.location.isim} Konum', style: Sabitler.detailsAppBarTextStyle,),
      ),
      body: Column(
        children:[
          Expanded(
            flex: 12,
            child: Container(
            margin: EdgeInsets.all(0),
            child: GoogleMap(
              
              markers: {marker},
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target: center, zoom: 13.0),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                color: Sabitler.ikinciRenk.shade900,
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text('GERİ',style: Sabitler.detailsButtonTextStyle,))
              ),
            )
          )

        ]
      ),
    );
  }
}
