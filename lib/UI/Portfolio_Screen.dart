import 'package:crypto_wallet/UI/profile_verification.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/CustomButton.dart';
import '../Utils/const_colors.dart';

class PortfolioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              "Place for managing all your crypto related"
                  .text
                  .size(15)
                  .color(ConstColors.darkGrey)
                  .make(),
              "day-to-day tasks simple and easy"
                  .text
                  .size(15)
                  .color(ConstColors.darkGrey)
                  .make(),
              Spacer(),
              SvgPicture.asset("assets/illustrations/wondering.svg"),
              Spacer(),
              CustomButton(
                  "Deposit Coins",
                  ConstColors.primaryBlue,
                  Colors.white,
                      () {}),
              60.heightBox
            ],
          ),
        ),
      ),
    );
  }
}
