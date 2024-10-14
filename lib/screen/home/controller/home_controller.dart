import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khata_app/screen/addentry/model/entry_model.dart';
import 'package:khata_app/screen/home/model/user_model.dart';
import 'package:khata_app/utils/helper/entry_helper.dart';
import 'package:khata_app/utils/helper/firebase_helper.dart';

class HomeController extends GetxController {
  RxList<userModel>list = <userModel>[].obs;
  RxList<entryModel>entryList = <entryModel>[].obs;
  RxList<entryModel>filterList = <entryModel>[].obs;
  Rxn<String> selectedValue = Rxn<String>();

  var totalAmount = 0.0.obs;
  var selectedValue1 = 1.obs;

  var selectedDate = DateTime
      .now()
      .obs;
  var selectedCreditDate = DateTime
      .now()
      .obs;
  String qua = "0";
  String price = "0";
  RxDouble debit = 0.0.obs;
  RxDouble credit = 0.0.obs;
  RxInt selectedRadioButton = 0.obs;
  RxInt index = 0.obs;


  Future<void> userGetData() async {
    List<userModel>l1 = await FBHelper.helper.read();
    list.value = l1;
  }

  Future<void> entryGetData() async {
    List<entryModel>l2 = await EntryHelper.helper.read();
    entryList.value = l2;
    getTotal();
  }

  void calculateTotal() {
    double qty = double.parse(qua);
    double prc = double.parse(price);
    totalAmount.value = qty * prc;
  }


  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  void pickCreditDate(BuildContext context) async {
    DateTime? pickedCreditDate = await showDatePicker(
      context: context,
      initialDate: selectedCreditDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedCreditDate != null) {
      selectedCreditDate.value = pickedCreditDate;
    } else {
      selectedValue1.value = 0;
    }
  }


  void getTotal() {
    debit.value = 0;
    credit.value = 0;
    for (var r in entryList) {
      if (r.status == 1) {
        debit.value = debit.value + double.parse(r.total!);
      }
      else {
        credit.value = credit.value + double.parse(r.total!);
      }
    }
  }

  void filterEntriesByUser(userModel user) {
    filterList.clear();
    for (var entry in entryList) {
      if (entry.id == user.id) {
        filterList.add(entry);
      }
    }
  }


}



