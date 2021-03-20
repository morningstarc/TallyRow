import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user.dart';
import '../model/project.dart';

class MyFirebase {
  static Future<String> createAccount({String email, String password}) async {
    AuthResult auth =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return auth.user.uid;
  }

  static void createProfile(User user) async {
    await Firestore.instance
        .collection(User.PROFILE_COLLECTION)
        .document(user.uid)
        .setData(user.serialize());
  }

  static Future<String> login({String email, String password}) async {
    AuthResult auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return auth.user.uid;
  }

  static Future<User> readProfile(String uid) async {
    DocumentSnapshot doc = await Firestore.instance
        .collection(User.PROFILE_COLLECTION)
        .document(uid)
        .get();
    return User.deserialize(doc.data);
  }
  static void signOut(){
    FirebaseAuth.instance.signOut();
  }


   static Future<String> addProject(Project project) async {
    DocumentReference ref =  await Firestore.instance
      .collection(Project.PROJECTSCOLLECTION)
      .add(project.serialize());
    return ref.documentID;
  }

  static Future<List<Project>> getProjects(String email) async {
    QuerySnapshot querySnapshot =  await Firestore.instance.collection(Project.PROJECTSCOLLECTION)
      .where(Project.CREATEDBY, isEqualTo: email)
      .getDocuments();
    var projectlist = <Project>[];
    if(querySnapshot == null || querySnapshot.documents.length == 0) {
      return projectlist;
    }
    for(DocumentSnapshot doc in querySnapshot.documents){
      projectlist.add(Project.deserialize(doc.data, doc.documentID));
    }
    return projectlist;
  }

  static Future<void> updateProject(Project project) async {
    await Firestore.instance.collection(Project.PROJECTSCOLLECTION)
          .document(project.documentID)
          .setData(project.serialize());
  } 

  static Future<void> deleteProject(Project project) async {
    await Firestore.instance.collection(Project.PROJECTSCOLLECTION)
      .document(project.documentID).delete();
  }


  static Future<List<Project>> getPublicProjects(bool public) async {
    try {
      QuerySnapshot querySnapshot = await Firestore.instance
            .collection(Project.PROJECTSCOLLECTION)
            .where(Project.PUBLIC, isEqualTo: true)
            .orderBy(Project.CREATEDBY)
            .getDocuments();
      var projects = <Project>[];
      if(querySnapshot == null || querySnapshot.documents.length == 0){
        return projects;
      }
      for(DocumentSnapshot doc in querySnapshot.documents){
        projects.add(Project.deserialize(doc.data, doc.documentID));
      }
      return projects;

    }catch (e){
      throw e;
    }
 }



}
