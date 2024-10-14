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
  TextEditingController txtArea = TextEditingController();
  TextEditingController txtPincode = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtState = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  HomeController controller = Get.put(HomeController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        iconTheme: IconThemeData(color: white),
        title:  Text("Add User",style: TextStyle(color: white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: txtName,
                  maxLength: 16,
                  keyboardType: TextInputType.name,
                 textCapitalization: TextCapitalization.characters,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    }
                    if (value.length > 16) {
                      return 'Maximum 16 characters allowed';
                    }
                    if (value[0] != value[0].toUpperCase()) {
                      return 'First letter must be capitalized';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text("Name"),
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
                SizedBox(height: h*0.01,),
                TextFormField(
                  controller: txtNumber,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (value.length != 10) {
                      return 'Please enter exactly 10 digits';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Only numbers are allowed';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text("Number"),
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
                SizedBox(height: h*0.01,),
                TextFormField(
                  controller: txtEmail,
                  maxLength: 25,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    // Regex for validating an Email
                    String emailPattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    if (!RegExp(emailPattern).hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text("Email"),
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
                SizedBox(height: h*0.01,),
                TextFormField(
                  controller: txtArea,
                  maxLength: 12,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    }
                    if (value.length < 2) {
                      return 'Maximum 12 characters allowed';
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text("Area"),
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
                SizedBox(height: h*0.01,),
                TextFormField(
                  controller: txtAddress,
                  maxLength: 32,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (value.length < 5) {
                      return 'Address must be at least 10 characters long';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9\s,.-]+$').hasMatch(value)) {
                      return 'Address can only contain alphanumeric characters, spaces, commas, and dots';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text("Address"),
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
                SizedBox(height: h*0.01,),
               Row(
                 children: [
                   Expanded(
                     child: TextFormField(
                       controller: txtCity,
                       maxLength: 12,
                       keyboardType: TextInputType.name,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Required';
                         }
                         if (value.length < 2) {
                           return 'City name must be at least 2 characters long';
                         }
                         if (value.length > 12) {
                           return 'City name must not exceed 50 characters';
                         }
                         return null;
                       },
                       decoration: InputDecoration(
                         label: const Text("City"),
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
                   SizedBox(width: w*0.01,),
                   Expanded(
                     child: TextFormField(
                       controller: txtState,
                       maxLength: 16,
                       keyboardType: TextInputType.name,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Required';
                         }
                         if (value.length < 2) {
                           return 'State must be at least 10 characters long';
                         }
                         if (!RegExp(r'^[a-zA-Z0-9\s,.-]+$').hasMatch(value)) {
                           return 'State can only contain alphanumeric characters, spaces, commas, and dots';
                         }
                         return null;
                       },
                       decoration: InputDecoration(
                         label: const Text("State"),
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
                SizedBox(height: h*0.02),
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
                        txtName.clear();
                        txtAddress.clear();
                        txtCity.clear();
                        txtArea.clear();
                        txtNumber.clear();
                        txtPincode.clear();
                        txtState.clear();
                        Get.back();

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
}
