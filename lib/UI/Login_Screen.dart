import 'package:crypto_wallet/UI/Home.dart';
import 'package:crypto_wallet/UI/PasswordForgot/pass_forgot_screen.dart';
import 'package:crypto_wallet/UI/sign_up_screen.dart';
import 'package:crypto_wallet/Utils/CustomButton.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../provider/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  static const routename = 'loginscreen';

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size * 1;
    final size = MediaQuery.of(context).size;
    final prov = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: sizeHeight.height,
            child: Column(
              children: [
                Column(
                  children: [
                    20.heightBox,
                    "Welcome Back!"
                        .text
                        .fontWeight(FontWeight.bold)
                        .size(26)
                        .make(),
                    40.heightBox,
                    SvgPicture.asset(
                      "assets/illustrations/login.svg",
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
                                  controller: prov.emailController,
                                  decoration: InputDecoration(
                                      labelText: "Email address",
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ConstColors.darkGrey)),
                                ),
                                TextFormField(
                                  obscureText: prov.isVisible,
                                  controller: prov.passwordController,
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
                                              : const Icon(Icons.visibility_off))),
                                ),
                                10.heightBox,
                                "Forgot your password?"
                                    .text
                                    .fontWeight(FontWeight.bold)
                                    .color(ConstColors.primaryBlue)
                                    .make()
                                    .onTap(() {
                                  Navigator.of(context).pushNamed(
                                      PasswordForgotScreen.routename);
                                })
                              ],
                            ),
                            (size.height * 0.18).heightBox,
                            CustomButton(
                                'Login', ConstColors.primaryBlue, Colors.white,
                                () {
                              prov.signUserIn(context);
                            }),
                            (size.height * 0.01).heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                "Don't have an account?".text.make(),
                                5.widthBox,
                                "Sign Up"
                                    .text
                                    .fontWeight(FontWeight.bold)
                                    .color(ConstColors.primaryBlue)
                                    .make()
                                    .onTap(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SignUpScreen()));
                                })
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
