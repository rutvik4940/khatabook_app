import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khata_app/screen/addentry/model/entry_model.dart';
import 'package:khata_app/utils/common/colors.dart';
import 'package:khata_app/utils/helper/entry_helper.dart';
import 'package:khata_app/utils/helper/firebase_helper.dart';

import '../../../utils/common/textstyle.dart';
import '../../home/controller/home_controller.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  HomeController controller = Get.put(HomeController());
  entryModel model = Get.arguments;
  final formKey = GlobalKey<FormState>();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtQua = TextEditingController();
  TextEditingController txtPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .sizeOf(context)
        .height;
    double w = MediaQuery
        .sizeOf(context)
        .width;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: bluePrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Transaction Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          height: h * 0.25,
          width: w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.80),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 0.8,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Entry Date:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: w * 0.13),
                  Text(
                    "${model.date}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Customer Name:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: w * 0.02),
                  Text(
                    "${model.username}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Product Name:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: w * 0.06),
                  Text(
                    "${model.name}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Product Quantity:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: w * 0.01),
                  Text(
                    "${model.qua}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Total Price:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: w * 0.13),
                  Text(
                    "${model.price}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Total Amount:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: w * 0.07),
                  Text(
                    "${model.total}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              if (model.creditDate !=
                  null) // Show only if creditDate is not null
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Collection Date:",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: w * 0.04),
                    Text(
                      "${model.creditDate}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
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
                  height: h * 0.06,
                  width: w,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: bluePrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Update Entry", style: textStyle.copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),


            // Second Button
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Are You Sure?",
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          EntryHelper.helper.delete(controller
                              .entryList[controller.index.value].id!);
                          controller.entryGetData();
                          Get.back();
                          Get.back();
                        },
                        child: const Text("Yes",style: TextStyle(color: Colors.red),),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                          Get.back();
                        },
                        child: const Text("No",style: TextStyle(color: Colors.green),),
                      ),
                    ],
                  );
                },
                child: Container(
                  height: h * 0.06,
                  width: w,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: bluePrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Delete",
                      style: textStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
