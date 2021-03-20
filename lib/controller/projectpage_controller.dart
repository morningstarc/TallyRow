import '../model/user.dart';
import '../view/projectpage.dart';
import '../model/project.dart';
import 'package:flutter/material.dart';
import '../view/mydialog.dart';
import '../controller/myfirebase.dart';



class ProjectPageController {
  ProjectPageState state;
  ProjectPageController(this.state);

  String validate(String value){
    if (value == null || value.length < 3) {
      return 'Entry must be at least 3 characters';
    }
    return null;
  }

  void saveName(String value){
    state.projectCopy.name = value;
  }


  void saveCraft(String value){
    state.projectCopy.craft = value;
  }

  void saveNotes(String value){
    state.projectCopy.notes = value;
  }


  void savePattern(String value){
    state.projectCopy.pattern = value;
  }

  String validateTags(String value){
    if(value == null || value.trim().isEmpty){
      return null;
    }
    for(var tag in value.split(',')){
      
      if(tag.length < 3){
        return 'Enter comma(,) separated tag list';

      }
    }
    return null;
   }

  void saveTags(String value){
    if(value == null || value.trim().isEmpty){
      return;
    }
    state.projectCopy.tags = [];
    List<String> tagslist = value.split(',');
    for(var tag in tagslist) {
    state.projectCopy.tags.add(tag.trim());
    }
  }

String validateYarns(String value){
    if(value == null || value.trim().isEmpty){
      return null;
    }
    for(var yarn in value.split(',')){
      
      if(yarn.length < 3){
        return 'Enter comma(,) separated yarn list';

      }
    }
    return null;
   }

  void saveYarns(String value){
    if(value == null || value.trim().isEmpty){
      return;
    }
    state.projectCopy.yarns = [];
    List<String> yarnslist = value.split(',');
    for(var yarn in yarnslist) {
    state.projectCopy.yarns.add(yarn.trim());
    }
  }


void createProject() async {
    if (!state.formKey.currentState.validate()) {
      return;
    }

    state.formKey.currentState.save();
    state.projectCopy.createdBy = state.user.email;
    try{
      if(state.project == null){
        state.projectCopy.documentID = await MyFirebase.addProject(state.projectCopy);
      } else {
        await MyFirebase.updateProject(state.projectCopy);
      }
    
    } catch (e) {
      MyDialog.info(
        context: state.context,
        title: 'Project Creation Failed',
        message: e.message != null ? e.message : e.toString(),
        action: () {Navigator.pop(state.context);
          Navigator.pop(state.context, null);
        },
      );
      return;
    }
    
    MyDialog.info(
      context: state.context,
      title: 'Project Created Successfully',
      message: 'Project ${state.projectCopy.name} created.',
       action: () {Navigator.pop(state.context);
          Navigator.pop(state.context, null);
       },
      );

  }



}