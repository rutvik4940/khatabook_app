import 'package:flutter/material.dart';
import 'package:khata_app/utils/common/colors.dart';
import 'package:khata_app/utils/common/textstyle.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
         backgroundColor: bluePrimary,
        title: const Text("Customer Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: h*0.12,
            width: w,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: black,
                  blurRadius: 0.1,
                ),
              ],
            ),
            child:  Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Customer Name:\t",style: textStyle1,),
                      Text("data",style: textStyle1,),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Customer Name:",style: textStyle1,),
                      Text("data",style: textStyle1,),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Customer Name:",style: textStyle1,),
                      Text("data",style: textStyle1,),
                    ],
                  ),
                ],
              ),
            ),
          ),
           SizedBox(height: h*0.02,),
           Padding(
             padding: const EdgeInsets.only(left: 8.0),
             child: Text("ENTRIES",style: textStyle1,),
           ),
          Expanded(
            child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: h * 0.16,
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
                  children: [
                    Row(
                      children: [
                        Text("Product Name :- ",style: textStyle1,),
                        Text("data",style: textStyle1,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Quantity :-",style: textStyle1,),
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
                        Text("Date :-",style: textStyle1,),
                        Text("data",style: textStyle1,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Collection Date :-",style: textStyle1,),
                        Text("data",style: textStyle1,),
                      ],
                    ),
                  ],
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}
