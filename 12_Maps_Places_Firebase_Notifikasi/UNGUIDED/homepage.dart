import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapsScreen(),
    );
  }
}

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  static const String apiKey = 'AIzaSyC_CQNGK5sXcqHNhEy-I42o4OFCOYAu-fw';
  static final LatLng _kInitialLocation =
      LatLng(19.018255973653343, 72.84793849278007);

  LatLng? _pickedLocation;
  GoogleMapController? _mapController;
  List<dynamic> _nearbyPlaces = [];
  bool _showNearbyPlaces = false;

  Future<void> _fetchNearbyPlaces(LatLng location) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
      '?location=${location.latitude},${location.longitude}'
      '&radius=1500'
      '&key=$apiKey',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("Nearby places response: $data");
      setState(() {
        if (data['results'] != null && data['results'].isNotEmpty) {
          _nearbyPlaces = data['results'];
          _showNearbyPlaces = true;
        } else {
          _showNearbyPlaces = false;
        }
      });
    } else {
      throw Exception('Failed to fetch nearby places');
    }
  }

  Future<void> _pickPlace() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: apiKey,
          initialLocation: _kInitialLocation,
          onPlacePicked: (result) {
            Navigator.of(context).pop();
            setState(() {
              _pickedLocation = LatLng(
                result.geometry!.location.lat,
                result.geometry!.location.lng,
              );
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Picker Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _pickPlace,
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _kInitialLocation,
              zoom: 11.0,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onTap: (LatLng location) {
              setState(() {
                _pickedLocation = location;
              });
            },
            markers: _pickedLocation == null
                ? {}
                : {
                    Marker(
                      markerId: MarkerId('picked-location'),
                      position: _pickedLocation!,
                    ),
                  },
          ),
          if (_pickedLocation != null)
            Positioned(
              bottom: 100,
              left: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () async {
                  if (_pickedLocation != null) {
                    await _fetchNearbyPlaces(_pickedLocation!);
                  }
                },
                child: Text('Show Nearby Places'),
              ),
            ),
          if (_showNearbyPlaces)
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                height: 250,
                child: ListView.builder(
                  itemCount: _nearbyPlaces.length,
                  itemBuilder: (context, index) {
                    final place = _nearbyPlaces[index];
                    return ListTile(
                      title: Text(place['name']),
                      subtitle: Text(place['vicinity'] ?? ''),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

extension on LocationResult {
  get geometry => null;
}
