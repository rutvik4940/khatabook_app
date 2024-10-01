import 'package:flutter/material.dart';
import 'package:khata_app/profile/view/profile_screen.dart';
import 'package:khata_app/screen/addentry/view/addentry_screen.dart';
import 'package:khata_app/screen/adduser/view/adduser_screen.dart';
import 'package:khata_app/screen/desh/view/desh_screen.dart';
import 'package:khata_app/screen/home/view/home_screen.dart';
import 'package:khata_app/screen/payment/view/paymentreminder_screen.dart';
import 'package:khata_app/screen/user/view/user_screen.dart';

Map<String,WidgetBuilder>app_routs={
  "/":(context)=>const DeshScreen(),
  "home":(context)=>const HomeScreen(),
  "user":(context)=>const UserScreen(),
  "add":(context)=>const AdduserScreen(),
  "entry":(context)=> AddEntryScreen(),
  "profile":(context)=>const ProfileScreen(),
  "payment":(context)=>const PaymentReminderScreen(),
};