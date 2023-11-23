import 'package:crypto_wallet/UI/ProfilePages/Profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/const_colors.dart';
import '../../provider/auth_provider.dart';
import 'ChangePassword.dart';

class SecurityPages extends StatefulWidget {
  const SecurityPages({Key? key}) : super(key: key);
  static const routename = 'securitypage';

  @override
  State<SecurityPages> createState() => _SecurityPagesState();
}

class _SecurityPagesState extends State<SecurityPages> {
  bool isTick = false;


  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size * 1;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: "Security".text.fontWeight(FontWeight.bold).size(26).make(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: sizeHeight.height,
            child: Column(
              children: [
                Column(
                  children: [
                    40.heightBox,
                    SvgPicture.asset(
                      "assets/illustrations/security.svg",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25))),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                profileCard(
                                    context: context,
                                    title: 'Change Password',
                                    onTap: () {
                                      Navigator.of(context).pushNamed(ChangePasswordScreen.routename);
                                    }),
                                SizedBox(height: 5,),
                                profileCard(
                                    context: context,
                                    title: 'Change Pin',
                                    onTap: () {}),
                                SizedBox(height: 5,),
                                profileCardAuth(
                                  widget: FlutterSwitch(
                                    inactiveColor: ConstColors.lightGrey,
                                      height: 32,
                                      width:55,
                                      value: isTick, onToggle: (val){
                                    setState(() {
                                      isTick = val;
                                    });
                                  }),
                                    context: context,
                                    title: 'Two-Factor Verification',),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget profileCardAuth(
    {required BuildContext context,
      required String title,
      required Widget widget,}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
    color: Color(0xFFEDF1F9),
    child: SizedBox(
      width: 340,
      height: 60,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            title.text.fontWeight(FontWeight.w600).size(19).makeCentered(),
            Spacer(),
            widget
          ],
        ),
      ),
    ),
  );
}
