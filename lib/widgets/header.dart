import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../controller/global_controller.dart';
class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  //caalling global controllers
  final GlobalController globalController = Get.put(GlobalController() , permanent: true);
  @override
  void initState() {
    getAddress(globalController.getLatitude().value, globalController.getLongitude().value);
    super.initState();
  }
  getAddress(lat, lon)async{
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    print(Placemark);
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality! ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(city),
    );
  }
}
