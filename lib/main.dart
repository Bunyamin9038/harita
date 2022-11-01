import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Completer<GoogleMapController> _mapcontroller = Completer();
  static const CameraPosition _center =
  CameraPosition(target: LatLng(41.00597999889418, 28.9982964957878), zoom: 14);

  final List<Marker> _marker = [];
  final List<Marker> _branch = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(40.875147, 29.099436),
      infoWindow: InfoWindow(title: "Position1", snippet: "testing1"),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(40.884274, 29.062781),
      infoWindow: InfoWindow(title: "Position2", snippet: "testing2"),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_branch);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map App"),
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller){
          _mapcontroller.complete(controller);
        },
        initialCameraPosition: _center,
      ),
    );
  }
}
