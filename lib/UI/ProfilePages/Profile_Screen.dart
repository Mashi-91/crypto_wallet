import 'package:crypto_wallet/UI/ProfilePages/ChangePassword.dart';
import 'package:crypto_wallet/UI/ProfilePages/Personal_Information.dart';
import 'package:crypto_wallet/UI/ProfilePages/SecurityPages.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/Utils/customCard.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  static const routename = 'profilescreen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: ConstColors.scaffoldColor,
          ),
          Positioned(
            top: size.height * 0.15,
            left: 15,
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_left)),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height * 0.8,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text('Mattie Hardwick',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19)),
                      20.heightBox,
                      profileCard(
                        context: context,
                          title: 'Personal information',
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(PersonalInformation.routename);
                          }),
                      5.heightBox,
                      profileCard(
                        context: context,
                          title: 'Phone number verification', onTap: () {}),
                    ],
                  ),
                  20.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Settings",
                          style: Theme.of(context).textTheme.titleMedium),
                      5.heightBox,
                      profileCard(
                        context: context,
                          title: 'Default Currency', isok: true, onTap: () {
                      }),
                      5.heightBox,
                      profileCard(
                        context: context,
                          title: 'Security',
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SecurityPages.routename);
                          }),
                      5.heightBox,
                      profileCard(context: context,title: 'Help & Support', onTap: () {}),
                      5.heightBox,
                      profileCard(context: context,title: 'Legaly', onTap: () {}),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.15,
            child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/illustrations/photo.jpg")),
          ),
        ],
      ),
    );
  }
}

Widget profileCard(
    {required BuildContext context,
    required String title,
    isok = false,
    required Function onTap,
    istoggleButton = false}) {
  final authProv = Provider.of<AuthProvider>(context);
  return GestureDetector(
    onTap: () => onTap(),
    child: Card(
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
              isok
                  ? Text(
                      'Dollar (USD)',
                      style: TextStyle(
                          fontSize: 15,
                          color: ConstColors.darkGrey,
                          fontWeight: FontWeight.w600),
                    )
                  : ''.text.make(),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    ),
  );
}
