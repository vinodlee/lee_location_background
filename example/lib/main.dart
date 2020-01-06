import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:bound_service/bound_service.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
//  var currentLocation = LocationData;
//
//  var location = new Location();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    print("knfkhasdjfhsdhgfsd");
    // Platform messages may fail, so we use a try/catch PlatformException.
    Timer.periodic(Duration(seconds: 20), _runthis);

  }

//  _getdata() async {
//    try {
//      currentLocation = (await location.getLocation()) as Type;
//    } on PlatformException catch (e) {
//      if (e.code == 'PERMISSION_DENIED') {
//       String  error = 'Permission denied';
//      }
//      currentLocation = null;
//    }
//  }
  void _runthis(_) async{
    String platformVersion;

//    _getdata();

//    try {
//      platformVersion = await BoundService.platformVersion;
//
//    } on PlatformException {
//      platformVersion = 'Failed to get platform version.';
//    }
    print("RUNNING FROM DART");

    var currentLocation = LocationData;

    var location = new Location();
    location.onLocationChanged().listen((LocationData currentLocation) {
      print("mgkjdsnghsdjghg"+currentLocation.latitude.toString());
      print(currentLocation.longitude);
    });




    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {

      _platformVersion = platformVersion;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
