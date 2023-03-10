import 'dart:html';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
//  Create Various Variables
//Rx for reactive and Obs for observable
  final RxBool _isloading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

//Instance for them to be called
//  These are like  as setstate
  RxBool checkLoading() {
    return _isloading;
  }

  RxDouble getLatitude() {
    return _latitude;
  }

  RxDouble getLongitude() {
    return _longitude;
  }

//Inite state when we open a screen in setstate
  @override
  void onInit() {

    if (_isloading.isTrue) {
      getLocation();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    //Test if location services are enabled
    //For location Permission
    LocationPermission locationPermission ;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!isServiceEnabled){
    //  If service is not enabled
      return Future.error('Location Services are disabled');

    }
  //  Status of Permission
    locationPermission =  await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.deniedForever){
      return Future.error('Location Permission is denied');
    }
    else if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();

      if(locationPermission == LocationPermission.denied){
        return Future.error('Again Location Permission is denied');
      }
    }

  //  Getting the Current Position
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    ).then((value){
    //  Update our latitude and longitude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isloading.value = false;
    });

  }
}
