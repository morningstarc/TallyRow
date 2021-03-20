import 'package:flutter/material.dart';
import 'view/loginpage.dart';

void main() => runApp(TallyRowApp());

class TallyRowApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: LoginPage(),
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF), primaryColor: const Color(0xff818596) ),
    );
  }

}