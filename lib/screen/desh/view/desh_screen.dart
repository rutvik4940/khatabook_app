import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khata_app/screen/home/view/home_screen.dart';
import 'package:khata_app/screen/user/view/user_screen.dart';
import 'package:khata_app/utils/common/textstyle.dart';

import '../../../utils/common/colors.dart';

class DeshScreen extends StatefulWidget {
  const DeshScreen({super.key});

  @override
  State<DeshScreen> createState() => _DeshScreenState();
}

class _DeshScreenState extends State<DeshScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: bluePrimary,
            title: Text("KhataBook",style: TextStyle(color: white),),
            bottom: TabBar(
              indicatorColor: black,
              labelColor: white,
              unselectedLabelColor: bluePrimary,
              tabs: [
                Tab(
                  child: Text("Home", style: textStyle4),
                ),
                Tab(
                  child: Text("All User", style: textStyle4),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              UserScreen(),
            ],
          ),
          bottomNavigationBar:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed("entry");

              },
              child: Container(
                height: h*0.06,
                width: w,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: bluePrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Add Entry",
                    style: textStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          // Second Button
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed("add");

              },
              child: Container(
                height: h*0.06,
                width: w,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: bluePrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Add User",
                    style: textStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),)
    ,
    );
  }
}
