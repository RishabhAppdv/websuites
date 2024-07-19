import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';


import '../../Resources/all_fonts/all_fonts.dart';

import '../../utils/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../../utils/components/app_colors.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_10w.dart';
import '../../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_5h.dart';
import '../../view_models/controllers/save_token/save_token.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
   FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData ()async {
    try{
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name;
        userEmail = email;
      });

    }catch(e){
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
        backgroundColor:  AllColors.whiteColor,

        drawer: CustomDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.12'),

        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 130),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: Get.height / 3.6,
                    width: Get.width / 1,
                    decoration: BoxDecoration(
                  color: AllColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                      color: AllColors.blackColor.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Vinay Gupta',
                                style: TextStyle(
                            color: AllColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AllFonts.nunitoRegular,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox10w(),
                              Container(
                                height: Get.height / 40,
                                width: Get.width / 6,
                                decoration: BoxDecoration(
                              color: AllColors.lightYellow,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Pending',
                                    style: TextStyle(
                                  color: AllColors.darkYellow,
                                        fontFamily: AllFonts.nunitoRegular,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '₹1,08,560',
                                style: TextStyle(
                              color: AllColors.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AllFonts.nunitoRegular),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'RealNova Healthcare',
                                  style: TextStyle(
                                color: AllColors.blackColor,
                                      fontFamily: AllFonts.nunitoRegular,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 30,
                                )
                              ]),
                          Text(
                            'Services:Pro(Yearly)',
                            style: TextStyle(
                          color: AllColors.lightGrey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: AllFonts.nunitoRegular),
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CREATED BY',
                                style: TextStyle(
                              color: AllColors.blackColor,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                              Text(
                                'PENDING AMOUNT',
                                style: TextStyle(
                              color: AllColors.blackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AllFonts.nunitoRegular),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: Get.height / 40,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                            color: AllColors.lighterPurple,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Nitin Sharma',
                                    style: TextStyle(
                                  color: AllColors.mediumPurple,
                                        fontFamily: AllFonts.nunitoRegular,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              Text(
                                '₹82560.00',
                                style: TextStyle(
                              color: AllColors.vividRed,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AllFonts.nunitoRegular),
                              )
                            ],
                          ),
                          SizedBox5h(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ORDER ID',
                                style: TextStyle(
                            color: AllColors.blackColor,
                                  fontFamily: AllFonts.nunitoRegular,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'PAID AMOUNT',
                                style: TextStyle(
                              color: AllColors.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AllFonts.nunitoRegular),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '# 003869',
                                style: TextStyle(
                              color: AllColors.grey,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                              Text(
                                '₹26000.00',
                                style: TextStyle(
                              color: AllColors.darkGreen,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AllFonts.nunitoRegular),
                              )
                            ],
                          ),
                          SizedBox5h(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SYNC WITH ZOHO',
                                style: TextStyle(
                            color: AllColors.blackColor,
                                  fontFamily: AllFonts.nunitoRegular,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'ORDERED DATE',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AllFonts.nunitoRegular,
                              color: AllColors.blackColor),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: Get.height / 40,
                                width: Get.width / 6.5,
                                decoration: BoxDecoration(
                            color: AllColors.lightBlue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.sync,
                                        size: 15,
                                  color: AllColors.darkBlue,
                                      ),
                                      Text(
                                        'Sync',
                                        style: TextStyle(
                                      color: AllColors.darkBlue,
                                            fontFamily:
                                                AllFonts.nunitoRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'May 31, 2024, 10:47 AM',
                                style: TextStyle(
                              color: AllColors.lightGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AllFonts.nunitoRegular),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: Get.height/6,
                    width: Get.width/1,
                    decoration: BoxDecoration(
                color: AllColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                    color: AllColors.blackColor.withOpacity(0.06),
                          blurRadius: 4,
                          spreadRadius: 2,
                        )
                      ]
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Mr. Arindam Gupta', style: TextStyle(
                          color: AllColors.lightGrey,
                                fontFamily: AllFonts.nunitoRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                              ),),

                              SizedBox10w(),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                height: Get.height/40,
                                decoration: BoxDecoration(
                            color: AllColors.lightYellow,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text('Complete', style: TextStyle(
                              color: AllColors.darkYellow,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AllFonts.nunitoRegular
                                  ),),
                                ),
                              ),

                              Spacer(),
                              Text('₹54,000', style: TextStyle(
                          color: AllColors.blackColor,
                                fontFamily: AllFonts.nunitoRegular,
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                              ),),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Zoic Life Sciences', style: TextStyle(
                            color: AllColors.blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: AllFonts.nunitoRegular
                              ),),
                              
                              Icon(Icons.arrow_drop_down_sharp, size: 30,)
                            ],
                          ),

                          Text('Services: Starter(Yearly)', style: TextStyle(
                      color: AllColors.lightGrey,
                          ),),
                          
                          Divider(
                            thickness: 0.4,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: Get.height/40,
                                width: Get.width/4,
                                decoration: BoxDecoration(
                            color: AllColors.lighterPurple,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text('Ashish Mohan', style: TextStyle(
                              color: AllColors.mediumPurple,
                                    fontFamily: AllFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12
                                  ),),
                                ),
                              ),

                              Text('#003869', style: TextStyle(
                          color: AllColors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: AllFonts.nunitoRegular

                              ),)
                            ],
                          )
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            //================================================================
            //CUSTOM APP BAR

            CustomAppBar(
                child: Row(
              children: [
                InkWell(
                  onTap : (){
                    _globalKey.currentState?.openDrawer();
                  },
                  child: Icon(
                    Icons.menu_sharp,
                    size: 25,
                  ),
                ),
                SizedBox10w(),
                Text(
                  'Orders',
                  style: TextStyle(
                color: AllColors.blackColor,
                      fontFamily: AllFonts.nunitoRegular,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
                Spacer(),
                Icon(
                  Icons.filter_list_outlined,
                  size: 15,
            color: AllColors.lightGrey,
                ),
                SizedBox5w(),
                Text(
                  'Filter',
                  style: TextStyle(
                color: AllColors.lightGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AllFonts.nunitoRegular),
                ),
                SizedBox10w(),
                Container(
                  height: Get.height / 30,
                  width: Get.width / 12,
                  decoration: BoxDecoration(
              color: AllColors.mediumPurple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.upload,
                    size: 20,
              color: AllColors.whiteColor,
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
