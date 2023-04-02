import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
class Result extends StatelessWidget {
  final String address1;
  final String address2;
  const Result({Key? key, required this.address1, required this.address2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('Distance'),
        backgroundColor: Colors.yellow.shade400,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: FutureBuilder(
            future: getDetails(address1, address2),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Column(
                  children: [
                    Text(snapshot.data?['address1'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Image.asset('assets/img_distance.png',height: 160,),
                    Text(snapshot.data?['address2'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                    const Padding(padding: EdgeInsets.all(8)),
                    Text(snapshot.data?['distance']?.toString()??'No Results', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ],
                );
              }
              return const Text('Calculating...');
            },
          )
        ),
      ),
    );
  }



  Future<Map> getDetails(query1, query2)async{
    Address address1 = (await Geocoder.local.findAddressesFromQuery(query1)).first;
    Address address2 = (await Geocoder.local.findAddressesFromQuery(query2)).first;
    (Geolocator.distanceBetween(address1.coordinates.latitude, address1.coordinates.longitude, address2.coordinates.latitude, address2.coordinates.longitude)/1000).round();
    return {
      'address1':address1.addressLine,
      'address2':address2.addressLine,
      'distance':(Geolocator.distanceBetween(address1.coordinates.latitude, address1.coordinates.longitude, address2.coordinates.latitude, address2.coordinates.longitude)/1000).round()
    };
  }

  Future<String> getAddress(String query)async{
    return (await Geocoder.local.findAddressesFromQuery(query)).first.addressLine;
  }
}
