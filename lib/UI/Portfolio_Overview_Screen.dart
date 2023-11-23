import 'package:crypto_wallet/UI/All_Asset_Screen.dart';
import 'package:crypto_wallet/UI/All_Transactions.dart';
import 'package:crypto_wallet/UI/Specific_Screen.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/Utils/customCard.dart';
import 'package:crypto_wallet/model/AssetModel.dart';
import 'package:crypto_wallet/model/TransactionModel.dart';
import 'package:crypto_wallet/provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/ChartModel.dart';
import '../model/Model.dart';

class PortfolioOverviewScreen extends StatelessWidget {
  static const routename = 'portfoliooverview';

  @override
  Widget build(BuildContext context) {
    MoneyFormatterOutput amount = MoneyFormatter(amount: 24825.90).output;
    final provider = Provider.of<ManageProvider>(context);
    final providerTransaction =
        Provider.of<TransactionProvider>(context, listen: false);
    final assetProvider = Provider.of<AssetProvider>(context);
    return Scaffold(
      backgroundColor: ConstColors.primaryBlue,
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(Icons.arrow_left, color: Colors.white,),
                  ),
                ),
                const Text("Portfolio",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(right: 28),
                  child: GestureDetector(
                    onTap: () {
                      provider.controller.toggle();
                    },
                    child: const Icon(
                      Icons.subject,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Text(
              "${amount.symbolOnLeft}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 32),
            ),
            Text(
              "Wallet Balance",
              style: TextStyle(color: ConstColors.lightGrey, fontSize: 15),
            ),
            Center(
              child: Container(
                height: 150,
                child: SfCartesianChart(
                  borderWidth: 0,
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    color: Color(0xFF71A2F4),
                    builder: (dynamic data, dynamic point, dynamic series,
                        int pointIndex, int seriesIndex) {
                      return Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                      );
                    },
                  ),
                  borderColor: Colors.transparent,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: NumericAxis(
                    minimum: 17,
                    maximum: 28,
                    isVisible: false,
                    interval: 1,
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 21000,
                    maximum: 33000,
                    interval: 1000,
                    isVisible: false,
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                  ),
                  series: <ChartSeries<ChartData, int>>[
                    SplineSeries(
                        dataSource: provider.data,
                        width: 2,
                        color: Colors.white,
                        enableTooltip: true,
                        xValueMapper: (ChartData data, _) => data.day,
                        yValueMapper: (ChartData data, _) => data.price)
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Day',
                      style: TextStyle(color: ConstColors.grey),
                    )),
                TextButton(
                  onPressed: () {},
                  child: Text('Week', style: TextStyle(color: Colors.white)),
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFF71A2F4)),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('Month',
                        style: TextStyle(color: ConstColors.grey))),
                TextButton(
                    onPressed: () {},
                    child: Text('Year',
                        style: TextStyle(color: ConstColors.grey))),
                TextButton(
                    onPressed: () {},
                    child:
                        Text('All', style: TextStyle(color: ConstColors.grey))),
              ],
            ).pOnly(bottom: 10),
            customContainer(context,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Assets",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: assetProvider.transactionData.length * 77,
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 5),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: assetProvider.transactionData.length,
                              itemBuilder: (_, i) {
                                return Column(
                                  children: [
                                    cardswithcrypto(
                                        iconPath: assetProvider
                                            .transactionData[i].iconPath,
                                        title: assetProvider
                                            .transactionData[i].title,
                                        subTitle: assetProvider
                                            .transactionData[i].subTitle,
                                        trailingAmount: assetProvider
                                            .transactionData[i].trailingAmount,
                                        trailingSubTitle: assetProvider
                                            .transactionData[i]
                                            .trailingSubTitle,
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              SpecificScreen.routename,
                                              arguments: {
                                                'title': assetProvider
                                                    .transactionData[i].title,
                                                'amount': assetProvider
                                                    .transactionData[i]
                                                    .trailingAmount,
                                                'subTitle': assetProvider
                                                    .transactionData[i].subTitle
                                              });
                                        }),
                                    5.heightBox
                                  ],
                                );
                              }),
                        ),
                        5.heightBox,
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: SizedBox(
                            width: 343,
                            height: 55,
                            child: DottedBorder(
                                color: ConstColors.lightGrey,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(25),
                                child: "+ Deposit more coins"
                                    .text
                                    .fontWeight(FontWeight.bold)
                                    .size(19)
                                    .color(ConstColors.lightGrey)
                                    .makeCentered()),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AllAssetScreen.routename);
                              },
                              child: "See All Assets"
                                  .text
                                  .fontWeight(FontWeight.bold)
                                  .color(ConstColors.primaryBlue)
                                  .make()),
                        ),
                        const Text(
                          "Latest transactions",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ).pOnly(bottom: 5),
                        SizedBox(
                          height: providerTransaction.transData.length * 76,
                          child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: providerTransaction.transData.length,
                              itemBuilder: (_, i) {
                                return Column(
                                  children: [
                                    cardwithtransaction(
                                        iconPath: providerTransaction
                                            .transData[i].iconPath,
                                        title: providerTransaction
                                            .transData[i].title,
                                        subTitle: providerTransaction
                                            .transData[i].trailingTitle,
                                        trailingTitle: providerTransaction
                                            .transData[i].trailingSubTitle,
                                        trailingSubTitle: providerTransaction
                                            .transData[i].subTitle),
                                    5.heightBox
                                  ],
                                );
                              }),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(AllTransactionScreen.routename);
                              },
                              child: "See All Transactions"
                                  .text
                                  .fontWeight(FontWeight.bold)
                                  .color(ConstColors.primaryBlue)
                                  .make()),
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
