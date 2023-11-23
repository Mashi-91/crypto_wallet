import 'package:crypto_wallet/UI/verification_confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../UI/PasswordForgot/pass_forgot_screen.dart';
import '../UI/sign_up_screen.dart';
import 'CustomButton.dart';
import 'const_colors.dart';

class customCard extends StatelessWidget {
  final String title;
  final dynamic icon;

  const customCard({super.key, required this.title, required this.icon});

  void onClick(BuildContext context) {
    Navigator.of(context)
        .pushNamed(VerificationPage.routename, arguments: {'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(context),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFFEDF1F9),
        child: SizedBox(
          width: 320,
          height: 50,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                icon,
                10.widthBox,
                title.text.fontWeight(FontWeight.bold).size(19).make(),
                Spacer(),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget customContainer(BuildContext context, {required Widget child}) {
  return Flexible(
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: child,
    ),
  );
}

Widget cardswithcrypto({
  required String iconPath,
  required String title,
  required String subTitle,
  required double trailingAmount,
  required String trailingSubTitle,
  required Function onTap,
}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Color(0xFFEDF1F9),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.text.fontWeight(FontWeight.bold).size(15).make(),
                subTitle.text.color(ConstColors.textColor).make()
              ],
            ).pOnly(left: 10),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MoneyFormatter(amount: trailingAmount)
                    .output
                    .symbolOnLeft
                    .text
                    .fontWeight(FontWeight.bold)
                    .size(15)
                    .make(),
                trailingSubTitle.text
                    .fontWeight(FontWeight.bold)
                    .color(ConstColors.green)
                    .make()
              ],
            ).pOnly(left: 10),
          ],
        ),
      ),
    ),
  );
}

Widget cardwithtransaction({
  required String iconPath,
  required double title,
  required String subTitle,
  required String trailingTitle,
  required String trailingSubTitle,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    color: Color(0xFFEDF1F9),
    elevation: 1,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MoneyFormatter(amount: title)
                  .output
                  .symbolOnLeft
                  .text
                  .fontWeight(FontWeight.bold)
                  .size(15)
                  .make(),
              subTitle.text.color(ConstColors.textColor).make()
            ],
          ).pOnly(left: 10),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                trailingTitle,
                style: TextStyle(
                    color: ConstColors.red.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              trailingSubTitle.text.make()
            ],
          ).pOnly(left: 10),
        ],
      ),
    ),
  );
}

Widget smallCard({required String text, required Function? onTap}) {
  return GestureDetector(
    onTap: () => onTap!(),
    child: SizedBox(
      height: 40,
      width: 90,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ConstColors.smallCardColor,
        elevation: 0,
        child: text.text
            .color(ConstColors.primaryBlue)
            .fontWeight(FontWeight.bold)
            .makeCentered(),
      ),
    ),
  );
}

Widget smallFilterCard({required Widget child, required Function onTap}) {
  return GestureDetector(
    onTap: ()=>onTap(),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: ConstColors.smallCardColor,
      elevation: 0,
      child: Row(
        children: [
          child,
          5.widthBox,
          Icon(Icons.arrow_drop_down, size: 15,color: ConstColors.darkGrey,).pOnly(top: 5,right: 5)
        ],
      ).pOnly(top: 5,bottom: 5,left: 10, right: 8),
    ),
  );
}

Widget checkButton({required Function onTap, required Widget child}) {
  return InkWell(
    onTap: ()=> onTap(),
    child: Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: child,
    ),
  );
}