class Project {
  String documentID, name, createdBy, pattern, craft, notes;
  List<dynamic> images;
  List<dynamic> tags;
  List<dynamic> yarns;

  bool public;

Project({
  this.name, 
  this.createdBy, 
  this.public,
  this.yarns,
  this.pattern,
  this.craft,
  this.images,
  this.tags,
  this.notes,
});

Project.empty() {
  this.name = '';
  this.createdBy = ''; 
  this.public = false;
  this.pattern = '';
  this.craft = '';
  this.notes = '';
  this.images = <dynamic>[];
  this.tags = <dynamic>[];
  this.yarns = <dynamic>[];

}

Project.clone(Project p) {
  this.documentID = p.documentID;
  this.name = p.name;
  this.createdBy = p.createdBy; 
  this.public = p.public;
  this.pattern = p.pattern;
  this.craft = p.craft;
  this.notes = p.notes;
  this.images = <dynamic>[]..addAll(p.images);
  this.tags = <dynamic>[]..addAll(p.tags);
  this.yarns = <dynamic>[]..addAll(p.yarns);


}


 Map<String, dynamic> serialize(){
    return <String, dynamic>{
      NAME: name,
      CREATEDBY: createdBy,
      PUBLIC: public,
      YARNS: yarns,
      PATTERN: pattern,
      CRAFT: craft,
      NOTES: notes,
      IMAGES: images,
      TAGS: tags,
    };
  }

 static Project deserialize(Map<String, dynamic> data, String docID){
   var project = Project(
      name: data[Project.NAME],
      createdBy: data[Project.CREATEDBY],
      public: data[Project.PUBLIC],
      yarns: data[Project.YARNS],
      pattern: data[Project.PATTERN],
      notes: data[Project.NOTES],
      craft: data[Project.CRAFT],
      images: data[Project.IMAGES],
      tags: data[Project.TAGS],

    );
    
    project.documentID = docID;
    return project;
  }

  static const PROJECTSCOLLECTION = 'projects';
  static const NAME = 'name';
  static const CREATEDBY = 'createdBy';
  static const IMAGES = 'images';
  static const PUBLIC = 'public';
  static const YARNS = 'yarns';
  static const CRAFT = 'craft';
  static const TAGS = 'tags';
  static const PATTERN = 'pattern';
  static const NOTES = 'notes';
}