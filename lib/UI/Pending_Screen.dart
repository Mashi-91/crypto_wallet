import 'package:crypto_wallet/UI/Home.dart';
import 'package:crypto_wallet/Utils/CustomButton.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class PendingScreen extends StatelessWidget {
  static const routename = 'pendingscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            "Well Done!"
                .text
                .fontWeight(FontWeight.bold)
                .size(26)
                .make()
                .pOnly(top: 50, bottom: 13),
            "Your profile is now being reviewed. You can "
                .text
                .color(ConstColors.midnightBlue)
                .makeCentered(),
            "expect it to finish in the next 24 hours."
                .text
                .color(ConstColors.midnightBlue)
                .makeCentered(),
            Spacer(),
            SvgPicture.asset(
              "assets/illustrations/running.svg",
              width: 240,
              height: 240,
            ),
            Spacer(),
            CustomButton("Go Back", ConstColors.primaryBlue, Colors.white,
                () => Navigator.of(context).pushReplacementNamed(Home.routename)),
            Spacer()
          ],
        ),
      ),
    );
  }
}
