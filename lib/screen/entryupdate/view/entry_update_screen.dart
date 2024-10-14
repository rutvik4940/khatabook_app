import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/common/colors.dart';
import '../../../utils/helper/entry_helper.dart';
import '../../addentry/model/entry_model.dart';
import '../../home/controller/home_controller.dart';

class EntryUpdateScreen extends StatefulWidget {
  const EntryUpdateScreen({super.key});

  @override
  State<EntryUpdateScreen> createState() => _EntryUpdateScreenState();
}

class _EntryUpdateScreenState extends State<EntryUpdateScreen> {
  final formKey = GlobalKey<FormState>();
  HomeController controller = Get.put(HomeController());
  TextEditingController txtName = TextEditingController();
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtQua = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  double h = 0;
  double w = 0;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        foregroundColor: white,
        iconTheme: IconThemeData(color: white),
        backgroundColor: bluePrimary,
        title: const Text("Add Entry"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: h),
        child: IntrinsicHeight(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: h * 0.02),
                  Obx(
                        () => DropdownButton(
                      dropdownColor: white,
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      hint: const Text(
                        "---Select Customer---",
                        style: TextStyle(fontSize: 20),
                      ),
                      value: controller.selectedValue.value,
                      isExpanded: true,
                      items: controller.list
                          .map(
                            (e) => DropdownMenuItem(
                          value: "${e.name}",
                          child: Center(
                            child: Text(
                              "${e.name}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        controller.selectedValue.value = value!;
                      },
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  TextFormField(
                    controller: txtName,
                    maxLength: 32,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      if (value.length < 2) {
                        return 'Name must be at least 2 characters long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text("Product Name"),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: txtQua,
                          onChanged: (value) {
                            controller.qua = value;
                            if (value.isEmpty) {
                              controller.qua = "0";
                            }
                            controller.calculateTotal();
                          },
                          maxLength: 12,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            if (value.length < 1) {
                              return 'Quntity name must be at least 1 characters long';
                            }
                            if (value.length > 12) {
                              return 'Quntity name must not exceed 50 characters';
                            }
                            double? quantity = double.tryParse(value);
                            if (quantity == null || quantity <= 0) {
                              return "Quantity must be greater than 0";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text("Product Quntity"),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: txtPrice,
                          onChanged: (value) {
                            controller.price = value;
                            if (value.isEmpty) {
                              controller.price = "0";
                            }
                            controller.calculateTotal();
                          },
                          maxLength: 16,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            if (value.length < 1) {
                              return 'Price must be at least 10 characters long';
                            }
                            double? price = double.tryParse(value);
                            if (price == null || price <= 0) {
                              return "Quantity must be greater than 0";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text("Product Price"),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  const Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 18),
                  ),
                  Obx(
                        () => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text(
                              'Debit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: controller.selectedValue1.value == 0
                                      ? Colors.black // Color when selected
                                      : bluePrimary),
                            ),
                            contentPadding: const EdgeInsets.all(2),
                            value: "0",
                            groupValue:
                            controller.selectedValue1.value.toString(),
                            onChanged: (value) {
                              controller.selectedValue1.value =
                                  int.parse(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            selected: true,
                            title: Text(
                              'Credit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: controller.selectedValue1.value == 0
                                      ? Colors.black
                                      : bluePrimary),
                            ),
                            value: "1",
                            groupValue:
                            controller.selectedValue1.value.toString(),
                            onChanged: (value) {
                              controller.selectedValue1.value =
                                  int.parse(value!);
                              controller.pickCreditDate(context);
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Obx(
                                  () => Text(
                                '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.pickDate(context);
                              },
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Obx(
                        () => Visibility(
                      visible: controller.selectedValue1.value == 1,
                      child: Text(
                        'Selected Date: ${controller.selectedCreditDate.value.day}/${controller.selectedCreditDate.value.month}/${controller.selectedCreditDate.value.year}',
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bluePrimary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          double qty = double.tryParse(txtQua.text) ?? 0.0;
                          double prc = double.tryParse(txtPrice.text) ?? 0.0;
                          double total = qty * prc;
                          String? creditDateStr;

                          if (controller.selectedValue1.value == 1) {
                            creditDateStr =
                            '${controller.selectedCreditDate.value.day}/${controller.selectedCreditDate.value.month}/${controller.selectedCreditDate.value.year}';
                          }
                          entryModel model = entryModel(
                            name: txtName.text,
                            qua: txtQua.text,
                            price: txtPrice.text,
                            date:
                            '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                            status: int.parse(
                                controller.selectedValue1.value.toString()),
                            username: "${controller.selectedValue}",
                            total: "$total",
                            creditDate: creditDateStr,
                          );
                          EntryHelper.helper.add(model);
                          controller.entryGetData();
                          txtQua.clear();
                          txtPrice.clear();
                          // controller.selectedValue1.value = 0;
                          // controller.totalAmount.value = 0;
                          // controller.selectedValue.value="0";
                          Get.back();
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: h * 0.06,
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: bluePrimary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Amount: ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Obx(
                              () => Text(
                            "\$${controller.totalAmount.value}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
