import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khata_app/utils/common/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/common/textstyle.dart';
import '../../home/controller/home_controller.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.userGetData();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: white,
        body: Obx(
          () => ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed("profile");
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  height: h * 0.10,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 30,
                              child: Text(
                                "${controller.list[index].name?.substring(0, 1)}",
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${controller.list[index].name}",
                                  style: textStyle),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${controller.list[index].number}",
                                style: textStyle,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton.filled(
                                onPressed: () async {
                                  String call =
                                      "tel:91${controller.list[index].number}";
                                  await launchUrl(Uri.parse(call));
                                },
                                icon: const Icon(Icons.call),
                              ),
                              IconButton.filled(
                                onPressed: () async {
                                  String sms =
                                      "sms:91${controller.list[index].number}";
                                  await launchUrl(Uri.parse(sms));
                                },
                                icon: const Icon(
                                  Icons.sms,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
