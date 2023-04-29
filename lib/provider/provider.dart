import 'package:crypto_wallet/UI/Transaction_Screen.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../UI/Portfolio_Overview_Screen.dart';
import '../UI/Portfolio_Screen.dart';
import '../Utils/const_colors.dart';
import '../model/ChartModel.dart';
import '../model/TransactionModel.dart';

class ManageProvider extends ChangeNotifier {
  var _currentIndex = 0;
  late FancyDrawerController controller;
  late List<ChartData> dummyData = data;



  final items = [
    SvgPicture.asset('assets/illustrations/minimize-2.svg'),
    Icon(
      FeatherIcons.box,
      color: ConstColors.grey,
    )
  ];

  late List<ChartData> data = [
    ChartData(17, 21500),
    ChartData(18, 22580),
    ChartData(19, 22594),
    ChartData(20, 24561),
    ChartData(21, 23705),
    ChartData(22, 26098, marker: "18,425.69"),
    ChartData(23, 25543),
    ChartData(24, 25076),
    ChartData(25, 23435),
    ChartData(26, 25452),
    ChartData(27, 23450),
    ChartData(28, 22503),
  ];

  final labels = ["Transactions", "Portfolio"];
  final appbarTitle = ["All Transactions", "Portfolio"];
  final pages = [
    TransactionScreen(),
    PortfolioScreen()
    // PortfolioOverviewScreen()
  ];

  get currentIndex => _currentIndex;

  void index(i) {
    _currentIndex = i;
    notifyListeners();
  }

  increatment() {
    _currentIndex++;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
