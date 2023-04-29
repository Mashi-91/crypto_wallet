import 'package:crypto_wallet/UI/Authenticate/auth_page.dart';
import 'package:crypto_wallet/UI/Login_Screen.dart';
import 'package:crypto_wallet/Utils/CustomButton.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/const_colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const routename = 'changepassword';

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AuthProvider>(context);
    final sizeHeight = MediaQuery
        .of(context)
        .size * 1;
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title:
        "Change Password".text.fontWeight(FontWeight.bold).size(26).make(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: sizeHeight.height,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
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
                                TextFormField(
                                  obscureText: prov.isVisible,
                                  controller: prov.oldPasswordController,
                                  decoration: InputDecoration(
                                      labelText: "Current Password",
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ConstColors.darkGrey),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            prov.toggleVisible();
                                          },
                                          icon: prov.isVisible
                                              ? Icon(FeatherIcons.eye)
                                              : Icon(FeatherIcons.eyeOff))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: prov.isVisible,
                                  controller: prov.newPasswordController,
                                  decoration: InputDecoration(
                                      labelText: "New Password",
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ConstColors.darkGrey),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            prov.toggleVisible();
                                          },
                                          icon: prov.isVisible
                                              ? Icon(FeatherIcons.eye)
                                              : Icon(FeatherIcons.eyeOff))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: prov.isVisible,
                                  controller: prov.repeatNewPasswordController,
                                  decoration: InputDecoration(
                                      labelText: "Repeat Password",
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ConstColors.darkGrey),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            prov.toggleVisible();
                                          },
                                          icon: prov.isVisible
                                              ? Icon(FeatherIcons.eye)
                                              : Icon(FeatherIcons.eyeOff))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.08,
                            ),
                            CustomButton(
                                'Change Password',
                                ConstColors.primaryBlue,
                                Colors.white, () async {
                              await prov.changePassword(
                                email: prov.currentUser?.email,
                                oldPassword: prov.oldPasswordController.text,
                                newPassword: prov.newPasswordController.text,);
                              const ScaffoldMessenger(
                                child: SnackBar(content: Text(
                                    'Successfully, Changed Password'),),);
                              await Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (_) => LoginOrRegister(context)), (
                                  route) => false);
                            })
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
