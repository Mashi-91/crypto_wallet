import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_wallet/Utils/const_colors.dart';
import 'package:crypto_wallet/model/TransactionModel.dart';
import 'package:crypto_wallet/model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final repeatNewPasswordController = TextEditingController();
  bool isVisible = true;
  bool isShowLoginPage = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    repeatNewPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  final Auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  void signUserIn(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      await Auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        errorMessage(context, title: "Incorrect Email");
      } else if (e.code == 'wrong-password') {
        errorMessage(context, title: "Wrong Password");
      }
    }
  }

  void signUserUp(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await Auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        errorMessage(context, title: "Password don't match!");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        errorMessage(context, title: "Incorrect Email");
      } else if (e.code == 'wrong-password') {
        errorMessage(context, title: "Wrong Password");
      }
    }
  }

  changePassword({email, oldPassword, newPassword}) async {
    var cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);

      await currentUser?.reauthenticateWithCredential(cred).then((value) {
        currentUser?.updatePassword(newPassword).whenComplete(() {
          Auth.signOut();
        });
      }).catchError((e){
        print(e.toString());
      });
  }

  resetPassword({required BuildContext context, email}) async {
    try {
      await Auth.sendPasswordResetEmail(email: email);
      await errorMessage(context,
          title: 'Password reset link sent! Check your email');
    } on FirebaseAuthException catch (e) {
      print(e);
      errorMessage(context, title: e.message.toString());
    }
  }

  //Store user Data in FireStore
  createUser(BuildContext context, UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => VxToast.show(context,
            msg: "Success, You account has been created.",
            position: VxToastPosition.bottom,
            textColor: ConstColors.green))
        .catchError((e, stackTrace) {
      VxToast.show(context,
          msg: "Error, Something went wrong. Try again",
          position: VxToastPosition.bottom,
          textColor: ConstColors.red);
    });
  }

  //Fetch Data from Firestore
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future errorMessage(BuildContext context, {required String title}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(title));
        });
  }

  getUserData(BuildContext context) {
    final email = Auth.currentUser?.email;
    if (email != null) {
      return getUserDetails(email);
    } else {
      VxToast.show(context, msg: "Error, Login to Continue");
    }
  }

  void signOut() async {
    await Auth.signOut();
    notifyListeners();
  }

  void toggleVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void togglePage() {
    isShowLoginPage = !isShowLoginPage;
    notifyListeners();
  }
}
