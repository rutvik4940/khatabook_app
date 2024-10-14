import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khata_app/screen/addentry/model/entry_model.dart';
import 'package:khata_app/utils/common/colors.dart';
import 'package:khata_app/utils/common/textstyle.dart';

import '../../home/controller/home_controller.dart';

class PaymentReminderScreen extends StatefulWidget {
  const PaymentReminderScreen({super.key});

  @override
  State<PaymentReminderScreen> createState() => _PaymentReminderScreenState();
}

class _PaymentReminderScreenState extends State<PaymentReminderScreen> {
  HomeController controller = Get.put(HomeController());
 late entryModel model;
  void initState() {
    super.initState();
    model = Get.arguments as entryModel;
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: bluePrimary,
          title: Text(
            "Payment Reminder",
            style: TextStyle(color: white),
          ),
        ),
        body: Column(
          children: [
            Obx(() =>  Text("${model.username}")),
          ],
        ));
  }
}
