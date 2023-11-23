import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:velocity_x/velocity_x.dart';

import '../UI/profile_verification.dart';
import 'CustomButton.dart';
import 'const_colors.dart';

Widget buildkycpage(BuildContext context) {
  return SafeArea(
    child: Column(
      children: [
        "To be able to deposit assets to your wallet,"
            .text
            .size(15)
            .color(ConstColors.darkGrey)
            .make(),
        " please start your profile verification."
            .text
            .size(15)
            .color(ConstColors.darkGrey)
            .make(),
        Spacer(),
        SvgPicture.asset("assets/illustrations/scan.svg"),
        Spacer(),
        CustomButton(
            "Start Profile Verification",
            ConstColors.primaryBlue,
            Colors.white,
            () =>
                Navigator.of(context).pushNamed(ProfileVerification.routename)),
        60.heightBox
      ],
    ),
  );
}

Widget buildkycpendingpage(BuildContext context) {
  return SafeArea(
    child: Column(
      children: [
        "Your Profile Verification is now in progress. If you"
            .text
            .size(15)
            .color(ConstColors.darkGrey)
            .make(),
        "don't receive a confirmation in the next 24 hours, "
            .text
            .size(15)
            .color(ConstColors.darkGrey)
            .make(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "please"
                .text
                .size(15)
                .color(ConstColors.darkGrey)
                .makeCentered(),
            " contact our support."
                .text
                .size(15)
            .fontWeight(FontWeight.bold)
                .color(ConstColors.primaryBlue)
                .makeCentered().onTap(() {})
          ],
        ),
        Spacer(),
        SvgPicture.asset("assets/illustrations/privacy.svg"),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/illustrations/pending.svg"),
            5.widthBox,
            "Verification in progress".text.size(19).fontWeight(FontWeight.bold).make()
          ],
        ),
        60.heightBox
      ],
    ),
  );
}
Widget buildmainpage(BuildContext context) {
  return SafeArea(
    child: Column(
      children: [
        "Your Profile Verification is now in progress. If you"
            .text
            .size(15)
            .color(ConstColors.darkGrey)
            .make(),
        "don't receive a confirmation in the next 24 hours, "
            .text
            .size(15)
            .color(ConstColors.darkGrey)
            .make(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "please"
                .text
                .size(15)
                .color(ConstColors.darkGrey)
                .makeCentered(),
            " contact our support."
                .text
                .size(15)
            .fontWeight(FontWeight.bold)
                .color(ConstColors.primaryBlue)
                .makeCentered().onTap(() {})
          ],
        ),
        Spacer(),
        SvgPicture.asset("assets/illustrations/privacy.svg"),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/illustrations/pending.svg"),
            5.widthBox,
            "Verification in progress".text.size(19).fontWeight(FontWeight.bold).make()
          ],
        ),
        60.heightBox
      ],
    ),
  );
}
