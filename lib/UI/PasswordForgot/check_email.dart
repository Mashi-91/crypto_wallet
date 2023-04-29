import 'package:crypto_wallet/UI/Login_Screen.dart';
import 'package:crypto_wallet/Utils/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/const_colors.dart';

class CheckEmail extends StatelessWidget {
  static const routename = 'checkemail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Check Your Email".text.make(),
      ),
      body: Column(
        children: [
          Column(
            children: [
              "Follow a password recovery instructions we have"
                  .text
                  .color(ConstColors.darkGrey)
                  .size(15)
                  .makeCentered(),
              " just sent to your email address"
                  .text
                  .size(15)
                  .color(ConstColors.darkGrey)
                  .makeCentered(),
            ],
          ),
          Spacer(),
          SvgPicture.asset('assets/illustrations/email.svg'),
          Spacer(),
          CustomButton(
              "Back to Login",
              ConstColors.primaryBlue,
              Colors.white,
              () => Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routename, (route) => false)).p24()
        ],
      ),
    );
  }
}
