import '../controller/projectpage_controller.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';
import '../model/project.dart';


class ProjectPage extends StatefulWidget {
  final User user;
  final Project project;
  ProjectPage(this.user, this.project);
  @override
  State<StatefulWidget> createState() {
    return ProjectPageState(user, project);
  }
}
  class ProjectPageState extends State<ProjectPage> {
    User user;
    Project project;
    Project projectCopy;
    bool public =  false;
    
    var formKey = GlobalKey<FormState>();
    TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);

    ProjectPageController controller;
    
    ProjectPageState(this.user, this.project){
        controller = ProjectPageController(this);
        if(project == null){
          projectCopy = Project.empty();
        }else {
          projectCopy = Project.clone(project);
        }
    }
  @override
  Widget build(BuildContext context) {
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
           
                Form(
                  key: formKey,
                  child:ListView(
                    shrinkWrap: true,
                    children: <Widget>[ 
                      SizedBox(height: 7.0),
                      TextFormField(
                        initialValue: projectCopy.name,
                        obscureText: false,
                        style: style,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Name of Project",
                          border:
                              OutlineInputBorder()),
                          validator: controller.validate,
                          onSaved: controller.saveName,
                      ),
                      SizedBox(height: 7.0),
                      TextFormField(
                        initialValue: projectCopy.craft,
                        style: style,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Craft Category",
                          border:
                              OutlineInputBorder()),
                          validator: controller.validate,
                          onSaved: controller.saveCraft,
                      ),
                      SizedBox(height: 7.0),
                      TextFormField(
                        initialValue: projectCopy.pattern,
                        style: style,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Pattern Name",
                          border:
                              OutlineInputBorder()),
                          validator: controller.validate,
                          onSaved: controller.savePattern,
                      ),
                      SizedBox(height: 7.0),
                      TextFormField(
                        initialValue: projectCopy.tags.join(',').toString(),
                        style: style,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Tags - separated by commas",
                          border:
                              OutlineInputBorder()),
                          validator: controller.validateTags,
                          onSaved: controller.saveTags,
                      ),
                      SizedBox(height: 7.0),
                      TextFormField(
                        initialValue: projectCopy.yarns.join(',').toString(),
                        style: style,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Yarns - separated by commas",
                          border:
                              OutlineInputBorder()),
                          validator: controller.validateYarns,
                          onSaved: controller.saveYarns,
                      ),
                      /* SizedBox(height: 7.0),
                      SwitchListTile(
                        title: Text('Public'),
                        onChanged: (value) => setState(() => public = value),
                        value: public,
                        activeTrackColor: Color(0xffE7C50F), 
                        activeColor: Color(0xffE7C50F),
                      ), */
                      SizedBox(height: 7.0),
                      TextFormField(
                        initialValue: projectCopy.notes,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: style,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Pattern Notes",
                          border:
                              OutlineInputBorder()),
                          validator: controller.validate,
                          onSaved: controller.saveNotes,
                      ),            
                      SizedBox(
                        height: 10.0,
                      ),
                       RaisedButton(
                        child: Text('Save'),
                        onPressed: controller.createProject,
                        color: Color(0xffE7C50F),
                      ),
                      SizedBox(
                        height: 10.0,
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


