import 'package:crypto_wallet/UI/Home.dart';
import 'package:crypto_wallet/UI/Login_Screen.dart';
import 'package:crypto_wallet/UI/welcome_screen.dart';
import 'package:crypto_wallet/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Home();
          }
          else {
            return LoginOrRegister(context) ;
          }
        },
      ),
    );
  }
}


Widget LoginOrRegister(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context);
  if (authProvider.isShowLoginPage) {
    return LoginScreen();
  }else {
    return WelcomeScreen();
  }
}

