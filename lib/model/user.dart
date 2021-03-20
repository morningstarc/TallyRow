
class User{
  String email, password, displayName;
  int zip;

  String uid;

  User({
    this.password,
    this.email,
    this.displayName,
    this.uid,
  });

  Map<String, dynamic> serialize(){
    return <String, dynamic>{
      EMAIL: email,
      DISPLAYNAME: displayName,
      UID: uid,
    };
  }

  static User deserialize(Map<String, dynamic> document){
    return User(
      email: document[EMAIL],
      displayName: document[DISPLAYNAME],
      uid: document[UID],
    );
  }

  static const PROFILE_COLLECTION = 'userprofile';
  static const EMAIL = 'email';
  static const DISPLAYNAME = 'displayName';
  static const UID = 'uid';
  
}