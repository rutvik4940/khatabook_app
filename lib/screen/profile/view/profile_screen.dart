import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khata_app/screen/home/model/user_model.dart';
import 'package:khata_app/utils/common/colors.dart';
import 'package:khata_app/utils/common/textstyle.dart';

import '../../home/controller/home_controller.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  HomeController controller = Get.put(HomeController());
  userModel model = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.entryGetData().then((_) {
      controller.filterEntriesByUser(model);
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: bluePrimary,
        iconTheme: IconThemeData(color: white),
        title: Text(
          "Customer Profile",
          style: TextStyle(color: white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: h * 0.12,
            width: w,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: black,
                  blurRadius: 0.1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Customer Name: ${model.name}", style: textStyle1),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Customer Number:", style: textStyle1),
                      // Replace "data" with actual data
                      Text(" ${model.number}", style: textStyle1),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Customer address:", style: textStyle1),
                      // Replace "data" with actual data
                      Text(" ${model.address}", style: textStyle1),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: h * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("ENTRIES", style: textStyle1),
          ),
          SizedBox(height: h * 0.01),
          Expanded(
            child: Obx(
                  () {
                if (controller.filterList.isEmpty) {
                  return const Center(
                    child: Text("No entries available for this user."),
                  );
                }
                return Obx(() =>
                   ListView.builder(
                    itemCount: controller.filterList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        height: h * 0.16,
                        width: w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: black,
                              blurRadius: 0.1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Product Name:-${controller.filterList[index].name}",
                                  style: textStyle1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Quantity:-${controller.filterList[index].qua}",
                                  style: textStyle1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Price:-${controller.filterList[index].price}",
                                  style: textStyle1,
                                ),
                                const Spacer(),
                                Text(
                                  "\$${controller.filterList[index].total}",
                                  style: TextStyle(
                                    color: controller.filterList[index].status == 1
                                        ? Colors.red
                                        : Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Entry Date:-${controller.filterList[index].date}",
                                  style: textStyle1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Visibility(
                                  visible:
                                  controller.filterList[index].creditDate !=
                                      null,
                                  child: Text(
                                    "Collection Date:-${controller.filterList[index].creditDate}",
                                    style: textStyle1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
