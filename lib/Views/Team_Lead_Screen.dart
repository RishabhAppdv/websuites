import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/Resources/components/Cards/TeamLeadScreen_Card/teamLeadScreen_card.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import 'package:websuites/View_model/controllers/save_token/save_token.dart';

import '../Resources/Assets/app_fonts.dart';
import '../Resources/components/app_colors.dart';

class TeamLeadScreen extends StatefulWidget {
  const TeamLeadScreen({super.key});

  @override
  State<TeamLeadScreen> createState() => _TeamLeadScreenState();
}

class _TeamLeadScreenState extends State<TeamLeadScreen> {
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
        userName = first_name!;
        userEmail = email!;
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
              version: '1.0.12')),
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
                  TeamLeadScreen_Card(
                      title: 'Shakshi Shakya', email: 'shakshi@gmail.com'),
                  TeamLeadScreen_Card(
                      title: 'Rahul Mahajan', email: 'rahul@gmail.com'),
                  TeamLeadScreen_Card(
                      title: 'Sherpal Singh',
                      email: 'sherpalbairagi@gmail.com'),
                  TeamLeadScreen_Card(
                      title: 'Pushpek Kumar', email: 'pushpek@gmail.com'),
                  TeamLeadScreen_Card(
                      title: 'Rohil Pathak', email: 'rohila99@gmail.com'),
                  TeamLeadScreen_Card(
                      title: 'Gucci mane', email: 'guccigagamane@gmail.com'),
                  TeamLeadScreen_Card(
                      title: 'Great Khali', email: 'khalibali999@gmail.com'),
                ],
              ),
            ),
          ),

          //================================================================
          //CUSTOM APP BAR

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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'My Team Lead',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFonts.nunitoRegular),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.filter_list_outlined,
                  size: 16,
                  color: AppColors.lightGrey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Filter',
                  style: TextStyle(
                      color: AppColors.lightGrey,
                      fontFamily: AppFonts.nunitoRegular,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
