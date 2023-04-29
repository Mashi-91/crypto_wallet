import 'package:country_list_pick/country_list_pick.dart';
import 'package:crypto_wallet/UI/document_verification.dart';
import 'package:crypto_wallet/Utils/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/const_colors.dart';

class ProfileVerification extends StatefulWidget {
  static const routename = 'profileverification';

  @override
  State<ProfileVerification> createState() => _ProfileVerificationState();
}

class _ProfileVerificationState extends State<ProfileVerification> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: 'Personal Information'.text.make(),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.89,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 50, top: 20, bottom: 40, right: 50),
                  child: LinearProgressBar(
                    maxSteps: 4,
                    progressType: LinearProgressBar.progressTypeLinear,
                    currentStep: 1,
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
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 25, right: 25, top: 25),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "First name",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ConstColors.darkGrey),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Last name",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ConstColors.darkGrey),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Street address",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ConstColors.darkGrey),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "City",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ConstColors.darkGrey),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Zip/Area code",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ConstColors.darkGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: CountryListPick(
                            initialSelection: "IN",
                            useSafeArea: false,
                            onChanged: (e) {
                              setState(() {});
                            },
                            pickerBuilder: (context, dynamic countryCode) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Citizenship"
                                      .text
                                      .color(ConstColors.darkGrey)
                                      .make(),
                                  Row(
                                    children: [
                                      Image.asset(
                                        countryCode.flagUri,
                                        package: 'country_list_pick',
                                        scale: 15,
                                      ),
                                      5.widthBox,
                                      Text(countryCode.name,
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 19)),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1.5,
                                    color: Colors.black.withOpacity(0.3),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Spacer(),
                        CustomButton(
                            "Next Step",
                            ConstColors.primaryBlue,
                            Colors.white,
                            () => Navigator.of(context)
                                .pushNamed(DocumentVerification.routename)),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
