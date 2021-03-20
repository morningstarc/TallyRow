import 'package:flutter/material.dart';
import '../controller/signuppage_controller.dart';
import '../model/user.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  SignUpPageController controller;
  bool _autoValidate = false;
  BuildContext context;
  var formKey = GlobalKey<FormState>();
  User user = User();

  SignUpPageState() {
    controller = SignUpPageController(this);
  }

  void stateChanged(Function fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
       resizeToAvoidBottomInset: false,
       backgroundColor: Colors.white,

      body: SingleChildScrollView(
      child: Center (
      child: Container(
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           SizedBox(
                  height: 200.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
        Form(
            key: formKey,
            autovalidate: _autoValidate,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  initialValue: user.email,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border:
                              OutlineInputBorder(),
                  ),
                  
                  validator: controller.validateEmail,
                  onSaved: controller.saveEmail,
                ),
                SizedBox(
                        height: 25.0,
                      ),
                TextFormField(
                  initialValue: user.password,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border:
                      OutlineInputBorder(),
                  ),
                  validator: controller.validatePassword,
                  onSaved: controller.savePassword,
                ),
                SizedBox(
                        height: 25.0,
                      ),
                TextFormField(
                  initialValue: user.displayName,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Display Name',
                     border:
                              OutlineInputBorder(),
                  ),
                  validator: controller.validateDisplayName,
                  onSaved: controller.saveDisplayName,
                ),
                SizedBox(
                        height: 25.0,
                      ),
                
                RaisedButton(
                  child: Text('Create Account'),
                  color: Color(0xffE7C50F),
                  onPressed:  controller.createAccount,
                ),
              ],
              ),
            ),
          ],
          ),
        ),
      ),
      ),
      ),
    );
  }
}
