import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khata_app/screen/addentry/model/entry_model.dart';
import 'package:khata_app/utils/common/colors.dart';
import 'package:khata_app/utils/common/textstyle.dart';

import '../../../utils/helper/entry_helper.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.entryGetData();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                  '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.pickDate(context);
                },
                icon: const Icon(Icons.date_range, color: Colors.black),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            height: h * 0.09,
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: black,
                  blurRadius: 0.8,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Debit Amount :",
                      style: textStyle1,
                    ),
                    Obx(() =>
                        Text("${controller.debit.value}", style: textStyle1)),
                  ],
                ),
                SizedBox(
                  height: h * 0.008,
                ),
                Row(
                  children: [
                    Text(
                      "Credit Amount :",
                      style: textStyle1,
                    ),
                    Obx(
                      () =>
                          Text("${controller.credit.value}", style: textStyle1),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                // reverse: false,
                itemCount: controller.entryList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed("transaction",
                          arguments: controller.entryList[index]);
                      controller.index.value=index;
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      height: h * 0.11,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: black,
                            blurRadius: 0.1,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: bluePrimary,
                                  radius: 30,
                                  child: Text(
                                    "${controller.entryList[index].username?.substring(0, 1)}",
                                    style:
                                        TextStyle(fontSize: 25, color: white),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${controller.entryList[index].name}",
                                      style: textStyle),
                                  SizedBox(
                                    height: h * 0.001,
                                  ),
                                  Text(
                                    controller.entryList[index].username ?? "No Name",
                                    style: const TextStyle(fontSize: 18),
                                    // style: textStyle,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                "\$${controller.entryList[index].total}",
                                style: TextStyle(
                                    color:
                                        controller.entryList[index].status == 1
                                            ? Colors.red
                                            : Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
