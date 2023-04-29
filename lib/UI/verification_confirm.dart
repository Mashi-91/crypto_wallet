import 'package:crypto_wallet/UI/Pending_Screen.dart';
import 'package:crypto_wallet/Utils/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/const_colors.dart';

class VerificationPage extends StatelessWidget {
  static const routename = 'verificationpage';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final title = routeArgs['title'] as String;
    return Scaffold(
        appBar: AppBar(
          title: "${title} Scan".text.make(),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 830,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 50, top: 20, bottom: 40, right: 50),
                  child: LinearProgressBar(
                    maxSteps: 4,
                    progressType: LinearProgressBar.progressTypeLinear,
                    currentStep: 3,
                    progressColor: ConstColors.primaryBlue,
                    backgroundColor: ConstColors.progressColor,
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          "Have a final check if all data is clearly visible and "
                              .text
                              .size(15)
                              .makeCentered(),
                          "that it matches the information you have  entered in"
                              .text
                              .size(15)
                              .makeCentered(),
                          " previous steps.".text.size(15).makeCentered(),
                          25.heightBox,
                          "Front Side"
                              .text
                              .size(26)
                              .color(ConstColors.grey)
                              .fontWeight(FontWeight.bold)
                              .makeCentered(),
                          5.heightBox,
                          SvgPicture.asset(
                            'assets/illustrations/ID-Front-Scan.svg',
                            height: 180,
                            width: 180,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: "Scan Again"
                                  .text
                                  .fontWeight(FontWeight.bold)
                                  .color(ConstColors.primaryBlue)
                                  .make()),
                          25.heightBox,
                          "Back Side"
                              .text
                              .size(26)
                              .color(ConstColors.grey)
                              .fontWeight(FontWeight.bold)
                              .makeCentered(),
                          5.heightBox,
                          SvgPicture.asset(
                            'assets/illustrations/ID-Back-Scan.svg',
                            height: 180,
                            width: 180,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: "Scan Again"
                                  .text
                                  .fontWeight(FontWeight.bold)
                                  .color(ConstColors.primaryBlue)
                                  .make()),
                          Spacer(),
                          CustomButton(
                              "Finish Verification",
                              ConstColors.primaryBlue,
                              Colors.white,
                              () => Navigator.of(context).pushNamed(PendingScreen.routename))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
