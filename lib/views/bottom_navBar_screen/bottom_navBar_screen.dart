import 'package:flutter/material.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/components/widgets/nav_bar/custom_navBar.dart';


class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,

      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton:

      FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.search, size: 27, color: AllColors.whiteColor,),
        backgroundColor: AllColors.vividPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}