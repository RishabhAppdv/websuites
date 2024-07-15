import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Resources/Assets/app_fonts.dart';
import 'package:websuites/Resources/app_textstyles/App_TextStyle.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_AppBar/Custom_AppBar.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_FloatingActionButton/custom_floatingActionButton.dart';
import 'package:websuites/Resources/components/Custom_Widgets/Custom_navBar/custom_naBar.dart';
import 'package:websuites/Resources/components/Drawer/AppDrawer.dart';
import '../Data/models/Response_model/LoginResponseModel.dart';
import '../Resources/Assets/app_Icons.dart';
import '../Resources/app_strings/app_strings.dart';
import '../Resources/components/Cards/create_new_lead_screen_Card/create_new_lead_screen_Widget.dart';
import '../Resources/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_15h.dart';
import '../Resources/components/app_colors.dart';
import '../View_model/controllers/save_token/save_token.dart';

class New_LeadList_screen extends StatefulWidget {
  const New_LeadList_screen({super.key});

  @override
  State<New_LeadList_screen> createState() => _New_LeadList_screenState();
}

class _New_LeadList_screenState extends State<New_LeadList_screen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();
  DateTime dateTime = DateTime.now();

  String userName = '';
  String? userEmail = "";


  @override
  void initState(){
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
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
      bottomNavigationBar: CustomBottomNavBar(),


        floatingActionButton: CustomFloatingButton(
            onPressed: (){},
            imageIcon: AppIcons.navSearch3,
            backgroundColor: AppColors.mediumPurple
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        key: _globalKey,
        backgroundColor: AppColors.whiteColor,
        drawer: AppDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.12'
        ),



        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 135,
                    ),
                   AppTextStyle.CreateNewLead_standardFields(context,
                       AppStrings.CreateNewLead_standardFields),
                    const SizedBox(
                      height: 28,
                    ),
                   AppTextStyle.CreateNewLead_firstName(context,
                       AppStrings.CreateNewLead_firstName),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_enterFirstName),
                    SizedBox_15h(),
                    AppTextStyle.CreateNewLead_lastName(context,
                        AppStrings.CreateNewLead_lastName),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_enterLastName),
                    SizedBox_15h(),
                  AppTextStyle.CreateNewLead_phoneNumber(context,
                      AppStrings.CreateNewLead_PhoneNumber),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 19,
                          width: Get.width / 1.56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lightGrey, // Specify the outline color here
                              width: 0.3
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: AppStrings.CreateNewLead_enterPhoneNumber,
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AppFonts.nunitoRegular,
                                  color: AppColors.lighterGrey,
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 20,
                          width: Get.width / 4.5,
                          decoration: BoxDecoration(
                            color: AppColors.vividPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child:
                            AppTextStyle.CreateNewLead_add(context, AppStrings.CreateNewLead_add)
                          ),
                        ),
                      ],
                    ),
                    SizedBox_15h(),
                   AppTextStyle.CreateNewLead_email(context, AppStrings.CreateNewLead_email),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 19,
                          width: Get.width / 1.56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lightGrey, // Specify the outline color here
                              width: 0.3,),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: AppStrings.CreateNewLead_emailExample,
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AppFonts.nunitoRegular,
                                  color: AppColors.lighterGrey,
                                )
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: Get.height / 20,
                          width: Get.width / 4.5,
                          decoration: BoxDecoration(
                            color: AppColors.vividPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child:
                          AppTextStyle.CreateNewLead_add(context, AppStrings.CreateNewLead_add)
                          ),
                        ),
                      ],
                    ),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_address(context,
                        AppStrings.CreateNewLead_Address),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_EnterAddress),
                    const SizedBox(
                      height: 20,
                    ),

                    AppTextStyle.CreateNewLead_city_pincode(context,
                        AppStrings.CreateNewLead_City_Pincode),


                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_City_Pincode),
                    SizedBox_15h(),

                   AppTextStyle.CreateNewLead_state(context,
                       AppStrings.CreateNewLead_State),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_State),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_Country(context,
                        AppStrings.CreateNewLead_Country),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_Country),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_Source(context,
                        AppStrings.CreateNewLead_Source),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_Source),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_Assigned_lead_to(context,
                        AppStrings.CreateNewLead_Assigned_lead_to),

                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: Get.height / 19,
                      width: Get.width / 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGrey, // Specify the outline color here
                          width: 0.3,),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: AppStrings.CreateNewLead_select,
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: AppFonts.nunitoRegular,
                              color: AppColors.lighterGrey,
                            )
                        ),
                      ),
                    ),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_Organisation(context,
                        AppStrings.CreateNewLead_organisation),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_Enter_Name),
                    SizedBox_15h(),

                   AppTextStyle.CreateNewLead_Divisions(context,
                       AppStrings.CreateNewLead_Divisions),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_select),
                    SizedBox_15h(),

                   AppTextStyle.CreateNewLead_ProductCategories(context,
                       AppStrings.CreateNewLead_Product_Categories),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_select),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_Requirement(context,
                        AppStrings.CreateNewLead_Requirement),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: Get.height / 6,
                      width: Get.width / 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGrey, // Specify the outline color here
                          width: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: AppStrings.CreateNewLead_Enter_Description,
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: AppFonts.nunitoRegular,
                              color: AppColors.lighterGrey,
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    AppTextStyle.CreateNewLead_CustomFields(context,
                        AppStrings.CreateNewLead_CustomFields),
                    const SizedBox(height: 30),

                    AppTextStyle.CreateNewLead_Pincode(context,
                        AppStrings.CreateNewLead_pincode),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_EnterPincode
                    ),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_Designation(context,
                        AppStrings.CreateNewLead_Designation),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_select),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_Website(context,
                        AppStrings.CreateNewLead_Website),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_Website),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_GSTNumber(context,
                        AppStrings.CreateNewLead_GSTNumber),

                    const CreateNewLeadScreenWidget(hintText:
                    AppStrings.CreateNewLead_GSTNumber),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_CustomerDivision(context,
                        AppStrings.CreateNewLead_CustomerDivision),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_select),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_IndustryType(
                        context, AppStrings.CreateNewLead_IndustryType),
                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_select),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_leadCategory(context,
                        AppStrings.CreateNewLead_LeadCategory),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_select),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_ContactPersonName(context,
                        AppStrings.CreateNewLead_ContactPersonName),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_EnterContactPersonName),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_ContactPersonNumber(context,
                        AppStrings.CreateNewLead_ContactPersonNumber),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_EnterContactPersonNumber),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_CompleteAddress(context,
                        AppStrings.CreateNewLead_CompleteAddress),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_EnterAddress),
                    SizedBox_15h(),

                    AppTextStyle.CreateNewLead_Industry(context,
                        AppStrings.CreateNewLead_Industry),

                    const CreateNewLeadScreenWidget(
                        hintText: AppStrings.CreateNewLead_Select),
                    const SizedBox(height: 30
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: Get.height / 24,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: AppColors.mediumPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: AppTextStyle.CreateNewLead_Create(context,
                                AppStrings.CreateNewLead_Create),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: Get.height / 24,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            color: AppColors.lighterGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: AppTextStyle.CreateNewLead_Reset(context,
                                AppStrings.CreateNewLead_Reset),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),

            //==================================================================
            //CUSTOM APP BAR


            CustomAppBar(
              child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          _globalKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          size: 25,
                          color: AppColors.blackColor,
                        )
                    ),
                    const SizedBox(width: 10,
                    ),
                   AppTextStyle.CreateNewLead_createNewLead(context,
                       AppStrings.CreateNewLead_createNewLead),
                    const Spacer(),
                    Container(
                      height: Get.height / 28,
                      width: Get.width / 3.4,
                      decoration: BoxDecoration(
                          color: AppColors.mediumPurple,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.cloud_download_sharp,
                            size: 16,
                            color: AppColors.whiteColor,
                          ),
                         AppTextStyle.CreateNewLead_ImportLeads(context, AppStrings.CreateNewLead_ImportLeads),
                        ],
                      ),
                    )
                  ],
                ),
              ),

          ],
        )
    );
  }
}
