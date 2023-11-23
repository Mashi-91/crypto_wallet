import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_wallet/UI/Home.dart';
import 'package:crypto_wallet/UI/Portfolio_Overview_Screen.dart';
import 'package:crypto_wallet/Utils/Custom_Drawer.dart';
import 'package:crypto_wallet/Utils/drawer.dart';
import 'package:crypto_wallet/model/UserModel.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/const_colors.dart';
import '../provider/provider.dart';

class Home extends StatefulWidget {
  static const routename = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ManageProvider>(context, listen: false);
    provider.controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ManageProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Material(
      child: CustomDrawer(
        backgroundColor: Colors.white,
        drawerItems: drawer(context: context,
            SignOut: () {
                  authProvider.signOut();
            },
        walletTap: ()=>Navigator.of(context).pushNamed(PortfolioOverviewScreen.routename),
        ),
        controller: provider.controller,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  title:
                      provider.labels[provider.currentIndex].text.make(),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () {
                            provider.controller.toggle();
                          },
                          icon: Icon(Icons.subject)),
                    )
                  ],
                ),
          body: provider.pages[provider.currentIndex],
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VxCircle(
                  backgroundColor: ConstColors.primaryBlue,
                  radius: 60,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                ),
                "Deposit".text.color(ConstColors.grey).make(),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: provider.items.length,
            tabBuilder: (i, isActive) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    provider.items[i],
                    Text(provider.labels[i],
                        style: TextStyle(
                            color: ConstColors.grey,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              );
            },
            leftCornerRadius: 25,
            rightCornerRadius: 25,
            height: 78,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            splashSpeedInMilliseconds: 0,
            backgroundColor: ConstColors.scaffoldColor,
            elevation: 0,
            gapLocation: GapLocation.center,
            activeIndex: provider.currentIndex,
            onTap: (i) => provider.index(i),
          ),
        ),
      ),
    );
  }
}
