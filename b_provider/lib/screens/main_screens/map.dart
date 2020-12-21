
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {

@override
_MyHomePageState createState() => _MyHomePageState();

MyHomePage();
}

class _MyHomePageState extends State<MyHomePage> {
StreamSubscription _locationSubscription;
// Location _locationTracker = Location();
Marker marker;
Circle circle;
GoogleMapController _controller;
var lat;
var longi;
LatLng markervalue;
LatLng testloc;

ScrollController scrollController;
bool dialVisible = true;
static LatLng _initialPosition;
static LatLng _lastMapPosition = _initialPosition;

_MyHomePageState();
@override
void initState() {
super.initState();
}

Future<LatLng> getCurrentLocation() async {
try {
Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
// var location = await _locationTracker.getLocation();
if (_controller != null) {
if (markervalue != null) {
testloc = LatLng(markervalue.latitude, markervalue.longitude);

// print(testloc);
} else {
testloc = LatLng(position.latitude, position.longitude);
setState(() {
_initialPosition = LatLng(position.latitude, position.longitude);
});
// print(testloc);
}

updateMarkerAndCircle(testloc);
animateCamera(testloc);
print(testloc);
return testloc;
} else {
print("controller null");
}
} on PlatformException catch (e) {
if (e.code == 'PERMISSION_DENIED') {
debugPrint("Permission Denied");
}
}
}

animateCamera(LatLng targetPosition) {
_controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
bearing: 0,
target: targetPosition,
tilt: 0,
zoom: 18.00)));
}

LatLng updateMarkerAndCircle(newLocalData) {
LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
print(latlng);
this.setState(() {
marker = Marker(
markerId: MarkerId("home"),
position: latlng,
//  rotation: newLocalData.heading,
draggable: true,
onDragEnd: ((value) {
markervalue = LatLng(value.latitude, value.longitude);
print(markervalue);
}),
// zIndex: 2,
// flat: true,
anchor: Offset(0.5, 0.5));
});
return markervalue;
}

@override
void dispose() {
if (_locationSubscription != null) {
_locationSubscription.cancel();
}
super.dispose();
}

void setDialVisible(bool value) {
setState(() {
dialVisible = value;
});
}

shareLocationButton(){
getCurrentLocation();
//this.model.onAddLocation(
//new TestLocation(testloc.latitude, testloc.longitude));
}


_onMapCreated(GoogleMapController controller) {
this._controller = controller;
getCurrentLocation();
}

CameraPosition initialLocation = CameraPosition(
target: LatLng(56.56, 98.51),
zoom: 14.4746,
);
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("Map"),
actions: <Widget>[
//Text(this.model.locations.isNotEmpty
//? this.model.locations[0].lat
//    : "hello"),
],
),
body: GoogleMap(
mapType: MapType.normal,
myLocationEnabled: true,
initialCameraPosition: initialLocation,
markers: Set.of((marker != null) ? [marker] : []

),
onMapCreated: (controller) => _onMapCreated(controller),
zoomGesturesEnabled: true,
compassEnabled: true,
myLocationButtonEnabled: false,
),
// floatingActionButton: SpeedDial(
//   // both default to 16
//   marginRight: 18,
//   marginBottom: 20,
//   animatedIcon: AnimatedIcons.menu_close,
//   animatedIconTheme: IconThemeData(size: 22.0),
//   // this is ignored if animatedIcon is non null
//   // child: Icon(Icons.add),
//   visible: dialVisible,
//   // If true user is forced to close dial manually
//   // by tapping main button and overlay is not rendered.
//   closeManually: false,
//   curve: Curves.bounceIn,
//   overlayColor: Colors.black,
//   overlayOpacity: 0.5,
//   onOpen: () => print(testloc),
//   onClose: () => print('DIAL CLOSED'),
//   tooltip: 'Speed Dial',
//   heroTag: 'speed-dial-hero-tag',
//   backgroundColor: Colors.white,
//   foregroundColor: Colors.black,
//   elevation: 8.0,
//   shape: CircleBorder(),
//   children: [
//     SpeedDialChild(
//       child: Icon(Icons.add_location),
//       backgroundColor: Colors.blueAccent,
//       label: 'Share Location',
//       labelStyle: TextStyle(fontSize: 18.0),
//       onTap: () => {
//               this.model.onAddLocation(
//                   new TestLocation(testloc.latitude, testloc.longitude)),
//               //      this.model.onAddCategory(new Category(Color(1), Color(2), "srrh", "zdtjhzerjh"))
//               //        this.model.onAddCategory(new Category(red,green,"hdgdg","jasjo")),
//             }
//     ),
//     SpeedDialChild(
//         child: Icon(Icons.edit_location),
//         backgroundColor: Colors.blueAccent,
//         label: 'Set Location',
//         labelStyle: TextStyle(fontSize: 18.0),
//         onTap: () => getCurrentLocation(),


//             ),
//   ],
// ),
floatingActionButton: FloatingActionButton(
child: Icon(Icons.share),
onPressed: () {
shareLocationButton();
// this.model.onAddLocation(new TestLocation(testloc.latitude, testloc.longitude));
}),
);
}
}