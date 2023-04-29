import 'package:crypto_wallet/Utils/customCard.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/model/Model.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/const_colors.dart';

class DocumentVerification extends StatelessWidget {
  static const routename = 'documentverification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: 'Document Verification'.text.make(),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 50, top: 20, bottom: 40, right: 50),
              child: LinearProgressBar(
                maxSteps: 4,
                progressType: LinearProgressBar.progressTypeLinear,
                currentStep: 2,
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
                      "Your document photo helps us prove your identity.\nIt should match the information you have provided"
                          .text
                          .size(15)
                          .color(ConstColors.midnightBlue)
                          .makeCentered(),
                      "in the previous steps."
                          .text
                          .color(ConstColors.midnightBlue)
                          .size(15)
                          .makeCentered(),
                      35.heightBox,
                      ...card.map((e) => Column(
                        children: [
                          customCard(title: e.title, icon: e.icon),
                          10.heightBox
                        ],
                      )).toList()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
