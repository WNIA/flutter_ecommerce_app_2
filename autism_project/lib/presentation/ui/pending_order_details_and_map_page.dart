import 'package:autism_project/core/helper/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class PendingOrderDetailsPage extends StatefulWidget {
  static final routeName = '/pending_order_details_page';
  final Map data;
  final int index;

  PendingOrderDetailsPage(this.data, this.index);

  @override
  _PendingOrderDetailsPageState createState() =>
      _PendingOrderDetailsPageState();
}

class _PendingOrderDetailsPageState extends State<PendingOrderDetailsPage> {
  GoogleMapController _mapController;
  Position _currentPosition;
  String _currentAddress = "";

/*Setting markers to show user location[red/default] and order location[blue]
* @WNIA
* */
  _createMarker() {
    try {
      return <Marker>[
        Marker(
            markerId: MarkerId("my location"),
            position:
                LatLng(_currentPosition.latitude, _currentPosition.longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: "Home")),
        Marker(
            markerId: MarkerId("order location"),
            position: LatLng(
                widget.data["OrderLatitude"], widget.data['OrderLongitude']),
            icon: BitmapDescriptor.defaultMarkerWithHue(220),
            infoWindow: InfoWindow(title: "Order"))
      ].toSet();
    } catch (e) {
      print(e);
    }
  }

  _mapCreated(GoogleMapController controller) {
    controller = _mapController;
  }

/*fetching user's current location using geolocator
fetching route from user location to order location
* @WNIA*/
  void getCurrentLatLng() async {
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _currentPosition = pos;
      getCurrentAddressFromLatLng(_currentPosition);
    });
  }
/*
* Converts Lat-Lng found from geolocator to address using geocoding
* @WNIA
* */
  void getCurrentAddressFromLatLng(Position pos) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    // String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address =
        "$name, $subLocality, $locality $postalCode, $country";

    print(name);
    print(subLocality);
    print(locality);
    print(postalCode);
    print(country);
    setState(() {
      _currentAddress = address;
    });
  }

/*fetching user's current location using Geolocator
* requesting for permission to read the device location
* @WNIA
* */
  @override
  void initState() {
    print('index is ${widget.index}');
    requestLocationPermission();
    getCurrentLatLng();
    super.initState();
  }

  // Marker startMarker = Marker(markerId: MarkerId('$startMarker'),
  //   position: LatLng(_currentPosition.latitude, _currentPosition.longitude);
  // );

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(widget.data["Created"]);
    String format = DateFormat('dd/MM/yyyy').format(date);

    return Scaffold(
        appBar: AppBar(
          title:
              Text('New Delivery Task', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: GoogleMap(
                  // markers: _markerList.toSet(),
                  onMapCreated: _mapCreated,
                  markers: _createMarker(),
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    zoom: 10.0,
                    target: LatLng(widget.data["OrderLatitude"],
                        widget.data["OrderLongitude"]),
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Order Date: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.grey)),
                      Text(format, style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.place_outlined, color: Colors.blueGrey, size: 30),
                      SizedBox(width: 4),
                      Flexible(child: Text(_currentAddress,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.0, color: Colors.grey[700], fontWeight: FontWeight.bold)))
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.place, color: Colors.blueGrey, size: 30),
                      SizedBox(width: 4),
                      Flexible(
                          child: Text(widget.data["OrderAddress"],
                              // maxLines: 1,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16.0, color: Colors.grey[700], fontWeight: FontWeight.bold)))
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45.0),
                        topLeft: Radius.circular(45.0)),
                  ),
                  child: Text("Accept",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
            )
          ],
        ));
  }
}
