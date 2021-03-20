import 'package:flutter/material.dart';
import '../controller/homepage_controller.dart';
import '../model/user.dart';
import '../model/project.dart';


class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user);
  @override
  State<StatefulWidget> createState() {
    return HomePageState(user);
  }
}

class HomePageState extends State<HomePage> {
  User user;
  Project project;
  HomePageController controller;
  BuildContext context;

  HomePageState(this.user) {
    controller = HomePageController(this);
  }

  void stateChanged(Function fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      onWillPop: (){return Future.value(false);},
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Home'),
             
                
        ),
       drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(user.displayName),
                accountEmail: Text(user.email),
              ),
              ListTile(
                leading: Icon(Icons.add_a_photo),
                title: Text('Upload Image'),
                onTap: controller.uploadImage,
              ),
              ListTile(
                leading: Icon(Icons.library_add),
                title: Text('Create Project'),
                onTap: controller.createProject,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign Out'),
                onTap: controller.signOut,
              ),
             /*  ListTile(
                leading: Icon(Icons.send),
                title: Text('Reset Password'),
                onTap: () => HomePageController.resetPassword(user),
              ), */
          
            ],
          ),
        ),
        body: 
        SizedBox.expand(

      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${user.email} ${user.displayName}'),
                FlatButton(
                          onPressed: controller.uploadImage,
                          child: new Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Text(
                                "Upload Image",
                                style: TextStyle(
                                    decoration:
                                    TextDecoration.underline,
                                    fontSize: 15.0),
                              ),
                          ),
                ),
                FlatButton(
                          onPressed: controller.createProject,
                          child: new Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Text(
                                "Create Project",
                                style: TextStyle(
                                    decoration:
                                    TextDecoration.underline,
                                    fontSize: 15.0),
                              ),
                          ),
                ),
              ],
              ),
          ),
        ),
      ),
        ),
        
      ),
    );
  }
}
