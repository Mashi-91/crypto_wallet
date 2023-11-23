import 'package:crypto_wallet/model/UserModel.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/CustomButton.dart';
import '../Utils/const_colors.dart';
import 'PasswordForgot/pass_forgot_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const routename = 'signupscreen';

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AuthProvider>(context);
    final sizeHeight = MediaQuery.of(context).size * 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: /*810*/ sizeHeight.height,
            child: Column(
              children: [
                Column(
                  children: [
                    35.heightBox,
                    "Create Account"
                        .text
                        .fontWeight(FontWeight.bold)
                        .size(26)
                        .make(),
                    60.heightBox,
                    SvgPicture.asset(
                      "assets/illustrations/office.svg",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
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
                                  controller: prov.fullNameController,
                                  decoration: InputDecoration(
                                      labelText: "First Name",
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ConstColors.darkGrey)),
                                ),
                                TextFormField(
                                  controller: prov.emailController,
                                  decoration: InputDecoration(
                                    labelText: "Email Address",
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: ConstColors.darkGrey),
                                  ),
                                ),
                                TextFormField(
                                  controller: prov.passwordController,
                                  obscureText: prov.isVisible,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: ConstColors.darkGrey),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          prov.toggleVisible();
                                        },
                                        icon: prov.isVisible
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                  ),
                                ),
                                TextFormField(
                                  controller: prov.confirmPasswordController,
                                  obscureText: prov.isVisible,
                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: ConstColors.darkGrey),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          prov.toggleVisible();
                                        },
                                        icon: prov.isVisible
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            CustomButton("Let's Get Started",
                                ConstColors.primaryBlue, Colors.white, () {
                              prov.signUserUp(context);
                            }),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                "Already have an account?".text.make(),
                                5.widthBox,
                                "Login"
                                    .text
                                    .fontWeight(FontWeight.bold)
                                    .color(ConstColors.primaryBlue)
                                    .make()
                                    .onTap(() {
                                  Navigator.pop(context);
                                })
                              ],
                            )
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
    ;
  }
}
