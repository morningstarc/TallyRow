import 'package:flutter/material.dart';
import '../controller/loginpage_controller.dart';
import '../model/user.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  LoginPageController controller;
  BuildContext context;
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);

  var user = User();
  var formKey = GlobalKey<FormState>();

  LoginPageState() {
    controller = LoginPageController(this);
  }

  void stateChanged(Function fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
     body: SingleChildScrollView(

      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 250.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Form(
                  key: formKey,
                  child:ListView(
                    shrinkWrap: true,
                    children: <Widget>[ 
                      SizedBox(height: 25.0),
                      TextFormField(
                        initialValue: user.email,
                        obscureText: false,
                        style: style,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Email",
                          border:
                              OutlineInputBorder()),
                          validator: controller.validateEmail,
                          onSaved: controller.saveEmail,
                      ),
                      SizedBox(height: 25.0),
                      TextFormField(
                        initialValue: user.password,
                        obscureText: true,
                        style: style,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Password",
                          border:
                              OutlineInputBorder()),
                          validator: controller.validatePassword,
                          onSaved: controller.savePassword,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                       RaisedButton(
                        child: Text('Login'),
                        onPressed: controller.login,
                        color: Color(0xffE7C50F),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      FlatButton(
                          onPressed: controller.createAccount,
                          child: new Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Text(
                                "Don't Have An Account?",
                                style: TextStyle(
                                    decoration:
                                    TextDecoration.underline,
                                    fontSize: 15.0),
                              )),
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
