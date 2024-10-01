import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khata_app/screen/home/controller/home_controller.dart';
import 'package:khata_app/screen/home/model/user_model.dart';
import 'package:khata_app/utils/helper/firebase_helper.dart';
import '../../../utils/common/colors.dart';
import '../../../utils/common/textstyle.dart';

class AdduserScreen extends StatefulWidget {
  const AdduserScreen({super.key});

  @override
  State<AdduserScreen> createState() => _AdduserScreenState();
}

class _AdduserScreenState extends State<AdduserScreen> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtNumber = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtArea = TextEditingController();
  TextEditingController txtPincode = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtState = TextEditingController();

  HomeController controller=Get.put(HomeController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        title: const Text("Add User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField("Name", txtName, TextInputType.text),
                buildTextField("Number", txtNumber, TextInputType.phone),
                buildTextField(
                    "Address", txtAddress, TextInputType.streetAddress),
                buildTextField("Area", txtArea, TextInputType.text),
                buildTextField("Pincode", txtPincode, TextInputType.number),

                SizedBox(
                  width: w * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                              "City", txtCity, TextInputType.text),
                        ),
                        SizedBox(width: w * 0.09),
                        // Add space between TextFields
                        Expanded(
                          child: buildTextField(
                              "State", txtState, TextInputType.text),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                // Add User Button
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                      userModel model=userModel(
                        state:txtState.text ,
                        pincode: txtPincode.text,
                        number: txtNumber.text,
                        name: txtName.text,
                        area: txtArea.text,
                        city:txtCity.text,
                        address: txtAddress.text,
                      );
                      await FBHelper.helper.add(model);
                      controller.userGetData();

                      }
                    },
                    child:  Text(
                      "Add User",
                      style: textStyle2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      TextInputType keyboardType) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
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
