import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class ConvertGeocodesToAddress extends StatefulWidget {
  @override
  _ConvertGeocodesToAddressState createState() =>
      _ConvertGeocodesToAddressState();
}

class _ConvertGeocodesToAddressState extends State<ConvertGeocodesToAddress> {
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
       _streamSubscription = Geolocator().getPositionStream(locationOptions).listen((Position position) {
        setState(() {
        print(position);
        _position = position;
        final coordinates =
            new Coordinates(position.latitude, position.longitude);
        convertCoordinatesToAddress(coordinates)
            .then((value) => _address = value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convert into address"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
            ),
            Text(
                "Location lat:${_position?.latitude ?? '-'}, lon:${_position?.longitude ?? '-'}"),
            SizedBox(
              height: 50,
            ),
            Text("Address from coordinates"),
            SizedBox(
              height: 20,
            ),
            Text("${_address?.addressLine ?? '-'}"),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }
}
