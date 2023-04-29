import 'dart:ffi';

import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/Utils/customCard.dart';
import 'package:crypto_wallet/model/TransactionModel.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/AssetModel.dart';

class AllTransactionScreen extends StatelessWidget {
  static const routename = 'allTransactionScreen';

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        FeatherIcons.arrowLeft,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text("All Transactions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                          onTap: () {
                            transactionProvider.filtertoggle();
                          },
                          child: transactionProvider.istap
                              ? Icon(
                                  FeatherIcons.x,
                                  color: ConstColors.primaryBlue,
                                )
                              : Icon(
                                  FeatherIcons.filter,
                                  color: ConstColors.primaryBlue,
                                ))
                      .pOnly(right: 15)
                ],
              ),
            ),
            20.heightBox,
            customContainer(context,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        transactionProvider.istap
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    smallFilterCard(
                                        child: Text('Transaction type'),
                                        onTap: () {
                                          filterButton(context, doneOnTap: () {
                                            Navigator.of(context).pop();
                                          },
                                              title: 'Transaction type',
                                              items: Column(
                                                children: [
                                                  tickTile(
                                                      icon: SvgPicture.asset(
                                                          'assets/transaction_icons/plus-circle.svg'),
                                                      title: "Deposited",
                                                      button: Consumer<
                                                          TransactionProvider>(
                                                        builder:
                                                            (_, prov, child) {
                                                          return Checkbox(
                                                              value:
                                                                  prov
                                                                      .istick,
                                                              onChanged: (val) =>
                                                                  prov
                                                                      .filterTickToggle(
                                                                          istick:
                                                                              !val!));
                                                        },
                                                      )),
                                                  tickTile(
                                                      icon: SvgPicture.asset(
                                                          'assets/transaction_icons/withdraw-icon.svg'),
                                                      title: "Withdraw",
                                                      button: Text('')),
                                                  tickTile(
                                                      icon: SvgPicture.asset(
                                                          'assets/transaction_icons/send-icon.svg'),
                                                      title: "Send",
                                                      button: Text('')),
                                                  tickTile(
                                                      icon: SvgPicture.asset(
                                                          'assets/transaction_icons/trade-icon.svg'),
                                                      title: "Exchange",
                                                      button: Text('')),
                                                ],
                                              ));
                                        }),
                                    smallFilterCard(
                                        child: Text('Coins'),
                                        onTap: () {
                                          filterButton(context, doneOnTap: () {
                                            Navigator.of(context).pop();
                                          }, title: 'Coins', items: Text(''));
                                        }),
                                    smallFilterCard(
                                        child: Text('Choose a date'),
                                        onTap: () {
                                          filterButton(context, doneOnTap: () {
                                            Navigator.of(context).pop();
                                          },
                                              title: 'Choose a date',
                                              items: Text(''));
                                        }),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.85,
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 5),
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  transactionProvider.transactionData2.length,
                              itemBuilder: (_, i) {
                                return Column(
                                  children: [
                                    cardwithtransaction(
                                        iconPath: transactionProvider
                                            .transactionData2[i].iconPath,
                                        title: transactionProvider
                                            .transactionData2[i].title,
                                        subTitle: transactionProvider
                                            .transactionData2[i].trailingTitle,
                                        trailingTitle: transactionProvider
                                            .transactionData2[i]
                                            .trailingSubTitle,
                                        trailingSubTitle: transactionProvider
                                            .transactionData2[i].subTitle),
                                    5.heightBox
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

dynamic filterButton(BuildContext context,
    {required Function doneOnTap,
    required String title,
    required Widget? items}) {
  return showModalBottomSheet(
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          height: 400,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: Theme.of(context).textTheme.labelMedium),
                  Text(
                    'Done',
                    style: TextStyle(
                        color: ConstColors.primaryBlue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ).onTap(() => doneOnTap())
                ],
              ),
              Row(
                children: [
                  smallCard(text: 'Select All', onTap: () {}),
                  8.widthBox,
                  smallCard(text: 'Clear All', onTap: () {}),
                ],
              ).pOnly(top: 20),
              items!
            ],
          ).p(24),
        );
      });
}

Widget tickTile(
    {required dynamic icon, required String title, required dynamic button}) {
  return Row(
    children: [
      Card(
        elevation: 0,
        color: const Color(0xFFF1F4FB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: icon,
        ),
      ),
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ).pOnly(left: 10),
      button
    ],
  ).pOnly(top: 10);
}
