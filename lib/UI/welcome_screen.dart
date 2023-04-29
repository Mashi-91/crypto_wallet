import 'package:crypto_wallet/UI/Login_Screen.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeScreen extends StatelessWidget {
  static const routename = 'welcomescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryBlue,
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: 40),
        child: Center(
            child: Column(
          children: [
            Spacer(),
            SvgPicture.asset('assets/illustrations/logo.svg'),
            30.heightBox,
            "Welcome to".text.size(35).color(ConstColors.grey).make(),
            "CRYPTOLET".text.color(Colors.white).size(45).make(),
            Spacer(),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26), color: Colors.white),
              child: "Welcome"
                  .text
                  .color(ConstColors.primaryBlue)
                  .fontWeight(FontWeight.bold)
                  .size(17)
                  .makeCentered(),
            ).onTap(() {
              Navigator.of(context).pushNamed(LoginScreen.routename);
            }),
            18.heightBox,
          ],
        )),
      ),
    );
  }
}
