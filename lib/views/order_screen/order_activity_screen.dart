import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import '../../Resources/all_fonts/all_fonts.dart';


import '../../utils/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../../utils/components/app_colors.dart';
import '../../utils/components/cards/order_activity_screen/order_activity_screen_card.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_10w.dart';
import '../../view_models/controllers/save_token/save_token.dart';

class OrderActivityScreen extends StatefulWidget {
  const OrderActivityScreen({super.key});

  @override
  State<OrderActivityScreen> createState() => _OrderActivityScreenState();
}

class _OrderActivityScreenState extends State<OrderActivityScreen> {
  final GlobalKey <ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData () async {
    try{
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState((){
        userName = first_name!;
        userEmail = email!;
      });

    }catch(e){
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      key: _globalKey,
      drawer: CustomDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'),

      body:
          Stack(
            children: [
              const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      OrderActivityScreenCard(title: 'Lucky 7(Yearly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Quarterly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Yearly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Quarterly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Yearly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Quarterly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Quarterly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Quarterly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Yearly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Quarterly)'),

                      OrderActivityScreenCard(title: 'Lucky 7(Quarterly)'),
                    ],
                  ),
                ),
              ),

              //================================================================
              //CUSTOM APP BAR

              CustomAppBar(
                  child:
                  Row(
                    children:[
                      InkWell(
                        onTap: (){
                          _globalKey.currentState?.openDrawer();
                        },
                          child: Icon(Icons.menu_sharp, size: 25,)),
                      SizedBox10w(),
                      Text('Activity', style: TextStyle(
                        color: AllColors.blackColor,
                        fontSize: 17,
                        fontFamily: AllFonts.nunitoRegular,
                        fontWeight: FontWeight.w700
                      ),),

                      Spacer(),
                      
                      Icon(Icons.filter_list_outlined, size: 15, color: AllColors.lightGrey,),
                      SizedBox5w(),
                      Text('Filter', style: TextStyle(
                        color: AllColors.lightGrey,
                        fontWeight: FontWeight.w400,
                        fontFamily: AllFonts.nunitoRegular,
                      ),)
                    ],
                  )
              )

            ],
          )



    );
  }
}
