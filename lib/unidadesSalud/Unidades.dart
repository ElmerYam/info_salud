import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;
//importamos la dependencia para obtener ubicacion actual
//import 'package:geolocator/geolocator.dart';

void main() => runApp(Unidades());

class Unidades extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Unidades> {
  //variables para la geolocalizacion
  TextEditingController locationController = TextEditingController();
  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
  //dsa
  final Map<String, Marker> _markers = {};


  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_getUserLocation();
  }
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Ubicaciones'),
        backgroundColor: Colors.blue[300],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: const LatLng(19.590933, -88.644348),
          zoom: 7,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        markers: _markers.values.toSet(),
      ),
    ),
  );

/*void _getUserLocation()  async {
        Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
        setState(() {
         _initialPosition = LatLng(position.latitude, position.longitude);
         locationController.text = placemark[0].name;
        });
      }*/

}
