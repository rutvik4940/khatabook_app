import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khata_app/screen/addentry/model/entry_model.dart';
import 'package:khata_app/screen/home/model/user_model.dart';
import 'package:khata_app/utils/helper/entry_helper.dart';
import 'package:khata_app/utils/helper/firebase_helper.dart';

class HomeController extends GetxController
{
  RxList<userModel>list=<userModel>[].obs;
  RxList<entryModel>entryList=<entryModel>[].obs;
  Rxn<String> selectedValue=Rxn<String>();
  var totalAmount = 0.0.obs;
  RxInt selectedValue1 = 0.obs ;
  var selectedDate = DateTime.now().obs;
  String qua="0";
  String price="0";




  Future<void> userGetData()
  async {
    List<userModel>l1=await FBHelper.helper.read();
    if(l1!=null)
      {
        list.value=l1;
      }
  }
  Future<void> entryGetData()
  async {
    List<entryModel>l2=await EntryHelper.helper.read();
    if(l2!=null)
    {
      entryList.value=l2;
    }
  }

  void  calculateTotal() {

      int qty = int.parse(qua)  ;
      double prc = double.parse(price) ;
      totalAmount.value = qty * prc;

  }


  Future<void> pickDate(BuildContext context) async {
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
}