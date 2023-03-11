import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';
class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  String now = DateFormat('yMMMMd').format(DateTime.now());
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
    return Column(
      children: [Container(
    margin: EdgeInsets.only(left: 20 , right: 20),
    alignment: Alignment.topLeft,
    child: Text('City'+ city,style: TextStyle(
    fontSize: 35,
      height: 1.6
    ),),
    ),
    Container(
    margin: EdgeInsets.only(left: 20 , right: 20, bottom: 20),
    alignment: Alignment.topLeft,
    child: Text(now,style: TextStyle(
    fontSize: 15,
      color: Colors.grey[700], height: 1.5
    ),),
    )
      ]
    );

  }
}
