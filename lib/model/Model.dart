import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class onboard extends ManageProvider{
  final String image, title, description;

  onboard(
      {required this.image, required this.title, required this.description});
}

class cardModel{
  final dynamic icon;
  final title;

  cardModel(this.icon,this.title);
}

List<onboard> data = [
  onboard(
      image: "desktop.svg",
      title: "Welcome to\nCryptolet",
      description: "Manage all your crypto assets! It's simple\nand easy!"),
  onboard(
      image: "idea.svg",
      title: "Nice and Tidy Crypto\nPortfolio",
      description: "Keep BTC, ETH, XRP and many other\nERC-20 based tokens."),
  onboard(
      image: "social.svg",
      title: "Receive and Send\nMoney to Friends!",
      description: "Send crypto to your friends with a personal\nmessage attached."),
  onboard(
      image: "mobile.svg",
      title: " Your Safety is Our\nTop Priority",
      description: "Our top-notch security features will keep\nyou completely safe."),

];
get _data => data;

final card = [
  cardModel( Icon(Icons.credit_card),"National ID"),
  cardModel(SvgPicture.asset('assets/illustrations/earth.svg'),"Passport",),
  cardModel(SvgPicture.asset('assets/illustrations/car.svg',height: 20,width: 20,color: ConstColors.darkGrey,),"Driver's Licence"),
];

get _card => card;