import 'package:crypto_wallet/UI/PasswordForgot/check_email.dart';
import 'package:crypto_wallet/Utils/CustomButton.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class PasswordForgotScreen extends StatelessWidget {
  static const routename = 'passwordscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Forgot Password?".text.make(),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: Column(
              children: [
                "Enter your registrated email address to receive"
                    .text
                    .color(ConstColors.darkGrey)
                    .makeCentered(),
                "password reset instruction"
                    .text
                    .color(ConstColors.darkGrey)
                    .makeCentered(),
              ],
            ),
          ),
          Consumer<AuthProvider>(builder: (_, prov, child) {
            return Flexible(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: prov.emailController,
                      decoration: InputDecoration(
                          labelText: "Email address",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ConstColors.darkGrey)),
                    ),
                    Spacer(),
                    CustomButton(
                        "Reset Password", ConstColors.primaryBlue, Colors.white,
                        () async {
                      await prov.resetPassword(
                          context: context,
                          email: prov.emailController.text.trim());
                      await Navigator.of(context).pushNamed(CheckEmail.routename);
                    }),
                    Spacer()
                  ],
                ),
              ),
            ));
          })
        ],
      ),
    );
  }
}
