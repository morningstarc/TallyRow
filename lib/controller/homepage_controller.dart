
import 'package:flutter/material.dart';
import 'package:tallyrow/view/projectpage.dart';
import '../controller/myfirebase.dart';
import '../view/homepage.dart';
import '../view/imagepage.dart';
import '../model/user.dart';
import '../model/project.dart';

class HomePageController{
  HomePageState state;

  HomePageController(this.state);

  void signOut(){
    MyFirebase.signOut();
    Navigator.pop(state.context);
    Navigator.pop(state.context);
  }

  void uploadImage() {
    Navigator.push(
        state.context,
        MaterialPageRoute(
          builder: (context) => ImagePage(),
        ));
  }

  void createProject() {
   

    Navigator.push(
        state.context,
        MaterialPageRoute(
          builder: (context) => ProjectPage(state.user, null),
        ));
  }
}