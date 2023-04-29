import 'package:crypto_wallet/UI/profile_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/CustomButton.dart';
import '../Utils/const_colors.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              "Make your first deposit for your transactions to"
                  .text
                  .size(15)
                  .color(ConstColors.darkGrey)
                  .make(),
              " become visible here."
                  .text
                  .size(15)
                  .color(ConstColors.darkGrey)
                  .make(),
              Spacer(),
              SvgPicture.asset("assets/illustrations/astro_kitten.svg"),
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
