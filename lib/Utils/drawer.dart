import 'package:crypto_wallet/UI/Login_Screen.dart';
import 'package:crypto_wallet/UI/ProfilePages/Profile_Screen.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/model/Model.dart';
import 'package:crypto_wallet/model/UserModel.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class drawer extends StatelessWidget {
  final Function SignOut;
  final Function walletTap;
  final BuildContext context;

  const drawer(
      {super.key,
      required this.SignOut,
      required this.context,
      required this.walletTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 200, right: 0, top: 80, bottom: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/illustrations/photo.jpg")),
          10.heightBox,
          Text('', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          // Text("Verify your profile",
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: ConstColors.primaryBlue,
          //         fontSize: 15)),
          60.heightBox,
          CustomTile(
              Icon(Icons.home, size: 28, color: ConstColors.lightGrey),
              "Wallet",
              () => walletTap()),
          30.heightBox,
          CustomTile(
              Icon(Icons.add_circle,
                  size: 28, color: ConstColors.lightGrey),
              "Deposit",
              () {}),
          30.heightBox,
          CustomTile(
              SvgPicture.asset('assets/illustrations/arrowUpLeft-Icon.svg',
                  height: 28, width: 28),
              "Withdraw",
              () {}),
          30.heightBox,
          CustomTile(
              SvgPicture.asset('assets/illustrations/arrowUpRight-Icon.svg',
                  height: 28, width: 28),
              "Send",
              () {}),
          30.heightBox,
          CustomTile(
              Icon(Icons.shuffle,
                  size: 28, color: ConstColors.lightGrey),
              "Exchange",
              () {}),
          30.heightBox,
          CustomTile(
              Icon(Icons.person, size: 28, color: ConstColors.lightGrey),
              "Profile", () {
            Navigator.of(context).pushNamed(ProfileScreen.routename);
          }),
          Spacer(),
          CustomTile(
              Icon(
                Icons.logout,
                size: 28,
                color: ConstColors.lightGrey,
              ),
              "Sign out",
              () => SignOut())
        ],
      ),
    );
  }
}

// Icon(FeatherIcons.home, size: 28,), "Wallet".text.size(19).make(),
// Icon(FeatherIcons.plusCircle,size: 28,), "Deposit".text.size(19).make(),
// Icon(FeatherIcons.arrowUpLeft, size: 28,), "Withdraw".text.size(19).make(),
// Icon(FeatherIcons.arrowUpRight, size: 28,), "Send".text.size(19).make(),
// Icon(FeatherIcons.shuffle, size: 28,), "Exchange".text.size(19).make(),
// Icon(FeatherIcons.user, size: 28,), "Profile".text.size(19).make(),

Widget CustomTile(dynamic iconData, String text, Function onTap) {
  return Row(
    children: [
      GestureDetector(
        onTap: () => onTap(),
        child: iconData,
      ),
      10.widthBox,
      text.text.size(19).make(),
    ],
  );
}

// List<cardModel> tiles = [
//   cardModel(
//       Icon(
//         FeatherIcons.home,
//         size: 28,
//       ),
//       "Wallet".text.size(19).make()),
//   cardModel(
//       Icon(
//         FeatherIcons.plusCircle,
//         size: 28,
//       ),
//       "Deposit".text.size(19).make()),
//   cardModel(
//       Icon(
//         FeatherIcons.arrowUpLeft,
//         size: 28,
//       ),
//       "Withdraw".text.size(19).make()),
//   cardModel(
//       Icon(
//         FeatherIcons.arrowUpRight,
//         size: 28,
//       ),
//       "Send".text.size(19).make()),
//   cardModel(
//       Icon(
//         FeatherIcons.shuffle,
//         size: 28,
//       ),
//       "Exchange".text.size(19).make()),
//   cardModel(
//       Icon(
//         FeatherIcons.user,
//         size: 28,
//       ),
//       "Profile".text.size(19).make()),
// ];
