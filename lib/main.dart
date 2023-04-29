import 'package:crypto_wallet/UI/All_Asset_Screen.dart';
import 'package:crypto_wallet/UI/All_Transactions.dart';
import 'package:crypto_wallet/UI/Authenticate/auth_page.dart';
import 'package:crypto_wallet/UI/Home.dart';
import 'package:crypto_wallet/UI/Login_Screen.dart';
import 'package:crypto_wallet/UI/PasswordForgot/check_email.dart';
import 'package:crypto_wallet/UI/PasswordForgot/pass_forgot_screen.dart';
import 'package:crypto_wallet/UI/Pending_Screen.dart';
import 'package:crypto_wallet/UI/ProfilePages/ChangePassword.dart';
import 'package:crypto_wallet/UI/ProfilePages/Personal_Information.dart';
import 'package:crypto_wallet/UI/Portfolio_Overview_Screen.dart';
import 'package:crypto_wallet/UI/ProfilePages/Profile_Screen.dart';
import 'package:crypto_wallet/UI/ProfilePages/SecurityPages.dart';
import 'package:crypto_wallet/UI/Specific_Screen.dart';
import 'package:crypto_wallet/UI/document_verification.dart';
import 'package:crypto_wallet/UI/profile_verification.dart';
import 'package:crypto_wallet/UI/sign_up_screen.dart';
import 'package:crypto_wallet/UI/verification_confirm.dart';
import 'package:crypto_wallet/UI/welcome_screen.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/firebase_options.dart';
import 'package:crypto_wallet/model/AssetModel.dart';
import 'package:crypto_wallet/model/TransactionModel.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:crypto_wallet/provider/onboarding_provider.dart';
import 'package:crypto_wallet/provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'UI/onbording_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ManageProvider()),
        ChangeNotifierProvider(
            create: (_) => onBoardingProvider(
                pageController: PageController(initialPage: 0))),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(
          create: (_) => AssetProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Crypto-Wallet',
          theme: getLightTheme(),
        routes: {
          '/': (_) => AuthPage(),
          LoginScreen.routename: (_) => LoginScreen(),
          PasswordForgotScreen.routename: (_) => PasswordForgotScreen(),
          CheckEmail.routename: (_)=>CheckEmail(),
          SignUpScreen.routename: (_)=>SignUpScreen(),
          Home.routename: (_)=>Home(),
          ProfileVerification.routename: (_)=>ProfileVerification(),
          DocumentVerification.routename: (_)=>DocumentVerification(),
          VerificationPage.routename:(_)=> VerificationPage(),
          PendingScreen.routename: (_)=>PendingScreen(),
          PortfolioOverviewScreen.routename: (_)=>PortfolioOverviewScreen(),
          SpecificScreen.routename: (_)=>SpecificScreen(),
          AllAssetScreen.routename: (_)=>AllAssetScreen(),
          AllTransactionScreen.routename: (_)=>AllTransactionScreen(),
          ProfileScreen.routename: (_)=>ProfileScreen(),
          PersonalInformation.routename:(_)=>PersonalInformation(),
          SecurityPages.routename:(_)=>SecurityPages(),
          ChangePasswordScreen.routename: (_)=>ChangePasswordScreen()
      },
        ),
    );
  }
}

ThemeData getLightTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: ConstColors.scaffoldColor,
    // scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      labelMedium: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 19,
          fontFamily: GoogleFonts.titilliumWeb().fontFamily),
      titleMedium: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 15,
          fontFamily: GoogleFonts.titilliumWeb().fontFamily),
      titleSmall: TextStyle(
          color: ConstColors.darkGrey,
          fontSize: 15,
          fontFamily: GoogleFonts.titilliumWeb(fontWeight: FontWeight.w400).fontFamily)
    ),
    iconTheme: IconThemeData(color: ConstColors.grey),
    appBarTheme: AppBarTheme(
        backgroundColor: ConstColors.scaffoldColor,
        // backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: GoogleFonts.titilliumWeb().fontFamily),
        iconTheme: IconThemeData(color: Colors.black)),
    fontFamily: GoogleFonts.titilliumWeb().fontFamily,
  );
}
