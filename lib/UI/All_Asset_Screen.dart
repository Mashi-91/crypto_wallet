import 'package:crypto_wallet/Utils/customCard.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/const_colors.dart';
import '../model/AssetModel.dart';

class AllAssetScreen extends StatelessWidget {
  static const routename = 'allAssetScreen';

  @override
  Widget build(BuildContext context) {
    final assetProvider = Provider.of<AssetProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 28, left: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_left,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text("All Assets",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                  ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton(
                              items: const [
                              DropdownMenuItem(child: Text('Coin'),enabled: true)
                            ], onChanged: (va){},
                              underline: Container(),
                              borderRadius: BorderRadius.circular(16),
                              icon: Icon(Icons.arrow_drop_down, size: 15,).pOnly(top: 5,left: 2),
                            ).pOnly(left: 10),
                            DropdownButton(
                              items: const [
                              DropdownMenuItem(child: Text('Amount'),enabled: true)
                            ], onChanged: (va){},
                              underline: Container(),
                              borderRadius: BorderRadius.circular(16),
                              icon: Icon(Icons.arrow_drop_down, size: 15,).pOnly(top: 5,left: 2),
                            ).pOnly(left: 10),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 5),
                              physics: BouncingScrollPhysics(),
                              itemCount: assetProvider.transactionData2.length,
                              itemBuilder: (_, i) {
                                return Column(
                                  children: [
                                    cardswithcrypto(
                                        iconPath: assetProvider
                                            .transactionData2[i].iconPath,
                                        title:
                                        assetProvider.transactionData2[i].title,
                                        subTitle: assetProvider
                                            .transactionData2[i].subTitle,
                                        trailingAmount: assetProvider
                                            .transactionData2[i].trailingAmount,
                                        trailingSubTitle: assetProvider
                                            .transactionData2[i].trailingSubTitle,
                                        onTap: () {}
                                    ),
                                    5.heightBox,
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
