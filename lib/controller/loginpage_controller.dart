import 'package:flutter/material.dart';
import '../controller/myfirebase.dart';
import '../model/user.dart';
import '../view/loginpage.dart';
import '../view/homepage.dart';
import '../view/mydialog.dart';
import '../view/signuppage.dart';

class LoginPageController {
  LoginPageState state;

  LoginPageController(this.state);

  void createAccount() {
    Navigator.push(
        state.context,
        MaterialPageRoute(
          builder: (context) => SignUpPage(),
        ));
  }

  String validateEmail(String value) {
    if (value == null || !value.contains('.') || !value.contains('@')) {
      return 'Enter a Valid Email Address';
    }
    return null;
  }

  void saveEmail(String value) {
    state.user.email = value;
  }

  String validatePassword(String value) {
    if (value == null || value.length < 6) {
      return 'Enter a valid password';
    }
    return null;
  }

  void savePassword(String value) {
    state.user.password = value;
  }

  void login() async {
    if (!state.formKey.currentState.validate()) {
      return;
    }
    state.formKey.currentState.save();

    MyDialog.showProgressBar(state.context);
    try {
      state.user.uid = await MyFirebase.login(
          email: state.user.email, password: state.user.password);
    } catch (e) {
      MyDialog.popProgressBar(state.context);
      MyDialog.info(
        context: state.context,
        title: 'Login Error',
        message: e.message != null ? e.message : e.message.toString(),
        action: () => Navigator.pop(
          state.context,
        ),
      );
      return;
    }
    try {
      User user = await MyFirebase.readProfile(state.user.uid);
      state.user.displayName = user.displayName;
    } catch (e) {
      //no displayName and zip can be updated
      print('*******READPROFILE' + e.toString());
    }

    MyDialog.popProgressBar(state.context);

    MyDialog.info(
      context: state.context,
      title: 'Login Success',
      message: 'Press <OK> to navigate to User Homepage',
      action: (){
        Navigator.pop(state.context);
        Navigator.push(state.context, MaterialPageRoute(
            builder: (context) => HomePage(state.user),
          ));
      }

    );
  }
}
