import 'dart:io';
import 'package:flutter/material.dart';
import '../controller/imagepage_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path; 

class ImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImagePageState();
  }
}

class ImagePageState extends State<ImagePage> {
  ImagePageController controller;
  BuildContext context;
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);
  File _image;
  String _uploadedFileURL; 
  var formKey = GlobalKey<FormState>();

  ImagePageState() {
    controller = ImagePageController(this);
  }

  void stateChanged(Function fn) {
    setState(fn);
  }

 



  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
     bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
             IconButton(
              icon: Icon(
                Icons.photo_camera,
                size: 30,
              ),
              onPressed: () => chooseFile(ImageSource.camera),
              color: Colors.blue,
            ),
            IconButton(
              icon: Icon(
                Icons.photo_library,
                size: 30,
              ),
              onPressed: () => chooseFile(ImageSource.gallery),
              color: Colors.pink,
            ), 
          ],
        ),
     ),
        body: ListView(
          children: <Widget>[
            _image != null
                ? Image.asset(
                    _image.path,
                    height: 150,
                  )
                : Container(height: 250),
           
            _image != null
                ? RaisedButton(
                    child: Text('Upload File'),
                    onPressed: uploadFile,
                    color: Colors.cyan,
                  )
                : Container(),
            _image != null
                ? RaisedButton(
                    child: Text('Clear Selection'),
                    onPressed: clearSelection,
                  )
                : Container(),
            Text('Uploaded Image'),
            _uploadedFileURL != null
                ? Image.network(
                    _uploadedFileURL,
                    height: 150,
                  )
                : Container(),
          ],
        ),
      );
  }



  Future<void> chooseFile(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _image = selected;
    });
  }
/*     Future chooseFileC() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((image) {
      setState(() {
        _image = image;
      });
    });
  } */

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  void clearSelection() {
    setState(() {
      _image = null;
      _uploadedFileURL = null;
    });
  }
}