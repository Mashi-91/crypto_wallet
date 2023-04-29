import 'package:flutter/material.dart';

class onBoardingProvider extends ChangeNotifier{
  final PageController pageController;
  onBoardingProvider({required this.pageController});

  int _pageIndex = 0;


  int get pageIndex => _pageIndex;


  void inreament(int i){
    _pageIndex = i;
    notifyListeners();
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}