import 'package:flutter/material.dart';
import 'package:khata_app/utils/common/colors.dart';
import 'package:khata_app/utils/common/textstyle.dart';

class PaymentReminderScreen extends StatefulWidget {
  const PaymentReminderScreen({super.key});

  @override
  State<PaymentReminderScreen> createState() => _PaymentReminderScreenState();
}

class _PaymentReminderScreenState extends State<PaymentReminderScreen> {

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: bluePrimary,
        title: Text("Payment Reminder",style: textStyle,),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("data"),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.date_range,
                  color: black,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: h * 0.14,
                width: w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:white,
                  boxShadow: [
                    BoxShadow(
                      color: black,
                      blurRadius: 0.1,
                    )
                  ],
                ),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Customer Name :- ",style: textStyle,),
                        Text("data",style: textStyle,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Product Name :- ",style: textStyle1,),
                        Text("data",style: textStyle1,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Price :-",style: textStyle1,),
                        Text("data",style: textStyle1,),
                        Spacer(),
                        Text("\$2000",style: textStyle1,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Product Quantity :-",style: textStyle1,),
                        Text("data",style: textStyle1,),
                      ],
                    ),

                  ],
                ),
              );
            },),
          ),
        ],
      ),
    );
  }
}
