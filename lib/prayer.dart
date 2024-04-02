import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class pray extends StatefulWidget {
  const pray({super.key});
  @override
  State<pray> createState() => _prayState();
}

class _prayState extends State<pray> {
   Location location = new Location();
  LocationData? _currentPositon;
  late double latitude, longitude;
  late DateTime asha, asr;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF6869D6), size: 33),
          title: Text("الصلاة",
              style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFF6869D6),
                  fontWeight: FontWeight.bold))),
      body: FutureBuilder(
        future: getLoc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black12),
            );
          }
          print("========================================================");
          print(latitude);
          print(longitude);
          final myCoordinates = Coordinates(
              latitude, longitude); // Replace with your own location lat, lng.
          final params = CalculationMethod.umm_al_qura.getParameters();
          params.madhab = Madhab.hanafi;
          final prayerTimes = PrayerTimes.today(myCoordinates, params);
          asr = prayerTimes.asr.subtract(Duration(hours: 1));
          asha = prayerTimes.isha.add(Duration(minutes: 30));
          print(asha);

          return Padding(
            padding: const EdgeInsets.all(2),
            child: Column(children: [
              Container(
                height: 10,
              ),
              Text("أوقات الصلاة",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Container(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 90.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(DateFormat.jm().format(prayerTimes.fajr),
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w200)),
                    Text("صلاة الفجر",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w200)),
                    Image.asset(
                      'img/moon.png',
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 90.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(DateFormat.jm().format(prayerTimes.dhuhr),
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w200)),
                    Text(" صلاة الظهر",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w200)),
                    Image.asset(
                      'img/sun.png',
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 90.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(DateFormat.jm().format(asr),
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w200)),
                    Text("صلاة العصر",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w200)),
                    Image.asset(
                      'img/asr.png',
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 90.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(DateFormat.jm().format(prayerTimes.maghrib),
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w200)),
                    Text("صلاة المغرب",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w200)),
                    Image.asset(
                      'img/mgreb.png',
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 90.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(DateFormat.jm().format(asha),
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w200)),
                    Text("صلاة العشاء",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w200)),
                    Image.asset(
                      'img/star.png',
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
            ]),
          );
        },
      ),
    ));
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPositon = await location.getLocation();
    latitude = _currentPositon!.latitude!;
    longitude = _currentPositon!.longitude!;
    print(latitude);
  }
}