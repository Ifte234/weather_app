import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_controller.dart';
import '../widgets/header.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  //caalling global controllers
  final GlobalController globalController = Get.put(GlobalController() , permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        
        child: Obx(() {
         return  globalController.checkLoading().isTrue ? Center(
           child: CircularProgressIndicator(),
         )
             :ListView(
           scrollDirection: Axis.vertical,
           children: [
             HeaderWidget()
           ],
         );
        }),
        
      ),
    );
  }
}
