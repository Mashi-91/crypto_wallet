import 'package:flutter/material.dart';

class AssetModel {
  String iconPath;
  String title;
  String subTitle;
  double trailingAmount;
  String trailingSubTitle;

  AssetModel(
      {required this.iconPath,
      required this.title,
      required this.subTitle,
      required this.trailingAmount,
      required this.trailingSubTitle});
}

class AssetProvider extends ChangeNotifier {
  late List<AssetModel> data = transactionData;

  List<AssetModel> transactionData = [
    AssetModel(iconPath: 'assets/crypto_icons/Bitcoin.svg', title: "Bitcoin (BTC)",subTitle:  '0.8934 BTC',
        trailingAmount: 8452.98,trailingSubTitle:  "+5.24%"),
    AssetModel(iconPath: 'assets/crypto_icons/Ethereum.svg',title:  "Ethereum (ETH)",
        subTitle: '8.0175 ETH',trailingAmount:  1825.72,trailingSubTitle:  "+1.45%"),
    AssetModel(iconPath: 'assets/crypto_icons/Litecoin.svg',title:  "Litecoin (LTC)",
        subTitle: '24.82 LTC', trailingAmount: 1378.45,trailingSubTitle:  "-0.91%"),
  ];
  List<AssetModel> transactionData2 = [
    AssetModel(iconPath: 'assets/crypto_icons/Bitcoin.svg', title: "Bitcoin (BTC)",subTitle:  '0.8934 BTC',
        trailingAmount: 8452.98,trailingSubTitle:  "+5.24%"),
    AssetModel(iconPath: 'assets/crypto_icons/Ethereum.svg',title:  "Ethereum (ETH)",
        subTitle: '8.0175 ETH',trailingAmount:  1825.72,trailingSubTitle:  "+1.45%"),
    AssetModel(iconPath: 'assets/crypto_icons/Litecoin.svg',title:  "Litecoin (LTC)",
        subTitle: '24.82 LTC', trailingAmount: 1378.45,trailingSubTitle:  "-0.91%"),
    AssetModel(iconPath: 'assets/crypto_icons/neo.svg',title:  "Neo (NEO)",
        subTitle: '0.8934 BTC', trailingAmount: 8452.98,trailingSubTitle:  "+5.24%"),
    AssetModel(iconPath: 'assets/crypto_icons/Stellar.svg',title:  "Stellar (XLM)",
        subTitle: '8.0175 ETH', trailingAmount: 1825.72,trailingSubTitle:  "+1.45%"),
  ];
}