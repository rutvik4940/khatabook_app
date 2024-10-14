import 'package:flutter/material.dart';
import 'package:khata_app/screen/addentry/view/addentry_screen.dart';
import 'package:khata_app/screen/adduser/view/adduser_screen.dart';
import 'package:khata_app/screen/desh/view/desh_screen.dart';
import 'package:khata_app/screen/entryupdate/view/entry_update_screen.dart';
import 'package:khata_app/screen/home/view/home_screen.dart';
import 'package:khata_app/screen/payment/view/paymentreminder_screen.dart';
import 'package:khata_app/screen/transaction/view/transaction_screen.dart';
import 'package:khata_app/screen/user/view/user_screen.dart';

import '../../screen/profile/view/profile_screen.dart';

Map<String,WidgetBuilder>app_routs={
  "/":(context)=>const DeshScreen(),
  "home":(context)=>const HomeScreen(),
  "transaction":(context)=>const TransactionScreen(),
  "entryUpdate":(context)=>const EntryUpdateScreen(),
  "user":(context)=>const UserScreen(),
  "add":(context)=>const AdduserScreen(),
  "entry":(context)=> AddEntryScreen(),
  "profile":(context)=>const ProfileScreen(),
  "payment":(context)=>const PaymentReminderScreen(),
};