import 'package:crypto_wallet/model/Model.dart';
import 'package:crypto_wallet/provider/provider.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class TransactionModel {
  String iconPath;
  double title;
  String subTitle;
  String trailingTitle;
  String trailingSubTitle;

  TransactionModel(this.iconPath, this.title, this.trailingTitle,
      this.trailingSubTitle, this.subTitle);
}

class TransactionProvider extends ChangeNotifier {
  late List<TransactionModel> transData = transactionData;
  late List<cardModel> button = db;
  bool istap = false;
  bool istick = false;

  void filtertoggle() {
    istap = !istap;
    notifyListeners();
  }

  void filterTickToggle({istick = true}) {
    istick = !istick;
    notifyListeners();
  }

  List<cardModel> db = [
    cardModel(SvgPicture.asset('assets/transaction_icons/plus-circle.svg'),
        "Deposit"),
    cardModel(SvgPicture.asset('assets/transaction_icons/withdraw-icon.svg'),
        "Withdraw"),
    cardModel(
        SvgPicture.asset('assets/transaction_icons/send-icon.svg'), "Send"),
    cardModel(SvgPicture.asset('assets/transaction_icons/trade-icon.svg'),
        "Exchange"),
  ];

  List tiledb = [
    SvgPicture.asset('assets/transaction_icons/plus-circle.svg'),
    SvgPicture.asset('assets/transaction_icons/withdraw-icon.svg'),
    SvgPicture.asset('assets/transaction_icons/send-icon.svg'),
    SvgPicture.asset('assets/transaction_icons/trade-icon.svg'),
  ];

  List<TransactionModel> transactionData = [
    TransactionModel('assets/transaction_icons/arrowUpLeft.svg', 204,
        '0.021 BTC', "Withdrawn", "Mar 25, 2023"),
    TransactionModel('assets/transaction_icons/arrowDownRight.svg', 695.03,
        '3.21 ETH', "Deposit", "Mar 22, 2023"),
    TransactionModel('assets/transaction_icons/arrowUpRight.svg', 250,
        '37.81 NEO', "Sent", "Mar 18, 2023"),
    TransactionModel('assets/transaction_icons/arrowUpLeft.svg', 204,
        '0.021 BTC', "Withdrawn", "Mar 16, 2023"),
    TransactionModel('assets/transaction_icons/arrowDownRight.svg', 695.03,
        '3.21 ETH', "Deposited", "Mar 13, 2023"),
  ];

  List<TransactionModel> transactionData2 = [
    TransactionModel('assets/transaction_icons/arrowUpLeft.svg', 204,
        '0.021 BTC', "Withdrawn", "Mar 25, 2023"),
    TransactionModel('assets/transaction_icons/arrowDownRight.svg', 695.03,
        '3.21 ETH', "Deposited", "Mar 22, 2023"),
    TransactionModel('assets/transaction_icons/arrowUpRight.svg', 250,
        '37.81 NEO', "Sent", "Mar 18, 2023"),
    TransactionModel('assets/transaction_icons/arrowUpLeft.svg', 204,
        '0.021 BTC', "Withdrawn", "Mar 16, 2023"),
    TransactionModel('assets/transaction_icons/arrowDownRight.svg', 695.03,
        '37.81 NEO', "Sent", "Mar 16, 2023"),
    TransactionModel('assets/transaction_icons/arrowUpRight.svg', 250.03,
        '3.21 ETH', "Deposited", "Mar 13, 2023"),
    TransactionModel('assets/transaction_icons/arrowDownRight.svg', 532,
        '2.41 ETH', "Deposited", "Mar 13, 2023"),
    TransactionModel('assets/transaction_icons/arrowUpRight.svg', 250.03,
        '37.21 NEO', "Sent", "Mar 13, 2023"),
  ];
}
