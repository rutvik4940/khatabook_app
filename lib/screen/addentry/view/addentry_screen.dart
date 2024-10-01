import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khata_app/screen/addentry/model/entry_model.dart';
import 'package:khata_app/utils/helper/entry_helper.dart';
import '../../../utils/common/colors.dart';
import '../../home/controller/home_controller.dart';

class AddEntryScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  HomeController controller = Get.put(HomeController());
  TextEditingController txtName = TextEditingController();
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtQua = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtPincode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        foregroundColor: white,
        backgroundColor: bluePrimary,
        title: const Text("Add Entry"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: h),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: h * 0.02),
                  Obx(
                    () => DropdownButton(
                      hint: Text("Select"),
                      value: controller.selectedValue.value,
                      isExpanded: true,
                      items: controller.list
                          .map(
                            (e) => DropdownMenuItem(
                                child: Text("${e.name}"), value: "${e.name}"),
                          )
                          .toList(),
                      onChanged: (value) {
                        controller.selectedValue.value = value! as String;
                      },
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  buildTextField("Product Name", txtName, TextInputType.number,(value) {

                  },),
                  SizedBox(height: h * 0.01),
                  SizedBox(
                    width: w * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildTextField(
                                "quantity", txtQua, TextInputType.text,(value) {
                                  controller.qua =value;
                                  if(value.isEmpty)
                                    {
                                      controller.qua="0" ;
                                    }
                              controller.calculateTotal();
                            },),
                          ),
                          SizedBox(width: w * 0.09),
                          Expanded(
                            child: buildTextField(
                                "Product Price", txtPrice, TextInputType.text,(value) {
                                  controller.price = value;
                                  if(value.isEmpty)
                                  {
                                    controller.price="0" ;
                                  }
                              controller.calculateTotal();
                            },),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  Text("Payment Method", style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Obx(() => 
                         buildRadioButton(
                          "Debit",
                          1,
                          controller,
                        ),
                      ),
                      Obx(() => buildRadioButton("Credit", 2, controller)),
                      Spacer(),
                      Obx(
                        () => Text(
                          '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      IconButton(
                        onPressed: () {
                          controller.pickDate(context);
                        },
                        icon: const Icon(Icons.date_range, color: Colors.black),
                      ),
                    ],
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
                          String status = controller.selectedValue1.value == 1
                              ? 'Debit'
                              : 'Credit';
                          entryModel model = entryModel(
                            name: txtName.text,
                            qua: txtQua.text,
                            price: txtPrice.text,
                            date:
                                '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                            status:int.parse(controller.selectedValue1.value.toString()),
                            username: "${controller.selectedValue}",
                            total:"${controller.totalAmount.value}" ,
                          );
                          EntryHelper.helper.add(model);
                          controller.entryGetData();
                          txtQua.clear();
                          txtPrice.clear();
                          controller.selectedValue1.value=0;
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
                      height: h * 0.05,
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
                            ()=> Text(
                              "\$${controller.totalAmount.value}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],

                    ),
                  ),
                  // SizedBox(height: h * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton(String label, int value, HomeController controller) {
    return Row(
      children: [
        Radio(
          activeColor: bluePrimary,
          value: value,
          groupValue: controller.selectedValue1.value,
          onChanged: (int? newValue) {
            controller.selectedValue1.value = newValue!;
          },
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      TextInputType keyboardType,Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: (value) {
          onChanged(value);
        },
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // filled: true,
          // fillColor:white,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }
}
