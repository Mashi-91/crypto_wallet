import 'package:crypto_wallet/UI/welcome_screen.dart';
import 'package:crypto_wallet/Utils/CustomButton.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/provider/onboarding_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/Model.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<onBoardingProvider>(
          builder: (_, onboardProvider, child) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: data.length,
                  controller: onboardProvider.pageController,
                  onPageChanged: (index) {
                   onboardProvider.inreament(index);
                  },
                  itemBuilder: (ctx, i) {
                    return Column(
                      children: [
                        Expanded(
                          child: OnboardContent(
                            image: data[i].image,
                            title: data[i].title,
                            description: data[i].description,
                            pageInd: onboardProvider.pageIndex,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: ConstColors.primaryBlue,
                    onTap: () {
                    },
                    child: onboardProvider.pageIndex == 3
                        ? CustomButton(
                            "Let's Get Started", ConstColors.primaryBlue,Colors.white, ()=>Navigator.of(context).pushNamed(
                        WelcomeScreen.routename))
                        : CustomButton("Next Step", Colors.transparent, ConstColors.primaryBlue,  (){
                      onboardProvider.pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    })),
              ),
            ],
          );

          }
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  OnboardContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.pageInd})
      : super(key: key);
  final String image, title, description;
  late int pageInd;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEDF1F9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {},
              child: pageInd == -1
                  ? Container()
                  : "Skip".text.fontWeight(FontWeight.bold).make()),
          Center(
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/illustrations/${image}",
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            data.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child:
                                      DotIndicator(isActive: index == pageInd),
                                ))
                      ],
                    ),
                    title.text
                        .fontWeight(FontWeight.bold)
                        .size(36)
                        .align(TextAlign.center)
                        .make(),
                    25.heightBox,
                    description.text.size(15).align(TextAlign.center).make(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: VxCircle(
        radius: 10,
        backgroundColor:
            isActive ? ConstColors.primaryBlue : ConstColors.lightGrey,
      ),
    );
  }
}
