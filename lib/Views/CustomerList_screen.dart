import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Cards/CustomerListScreen_Card/customerListScreen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';

class CustomersListScreen extends StatefulWidget {
  const CustomersListScreen({super.key});

  @override
  State<CustomersListScreen> createState() => _CustomersListScreenState();
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name;
        userEmail = email;
      });
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        backgroundColor: AppColors.whiteColor,
        drawer: Container(
          height: Get.height * 1,
          width: Get.width / 1.8,
          color: AppColors.whiteColor,
          child: AppDrawer(
              userName: '$userName',
              phoneNumber: '$userEmail',
              version: '1.0.12'),
        ),
        body: Stack(
          children: [
            const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                    CustomerList_Card(title: 'Harish Sharma'),
                  ],
                ),
              ),
            ),

            //====================================================================
            //AppBar Below

            CustomAppBar(
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      child: const Icon(
                        Icons.menu_sharp,
                        size: 25,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Customers',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.nunitoRegular,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: Get.height / 30,
                    width: Get.width / 13,
                    decoration: BoxDecoration(
                      color: AppColors.mediumPurple,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.upload,
                      size: 15,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: Get.height / 30,
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                        color: AppColors.mediumPurple,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 16,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Customer',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: AppFonts.nunitoRegular,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
