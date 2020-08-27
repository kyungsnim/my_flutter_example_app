import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter_example_app/constants/constants.dart';
import 'package:my_flutter_example_app/widgets/widgets.dart';

class RegistProfile extends StatefulWidget {
  @override
  _RegistProfileState createState() => _RegistProfileState();
}

class _RegistProfileState extends State<RegistProfile> {
  PickedFile _imageFile; // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
  final ImagePicker _picker = ImagePicker(); // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget('Regist Profile'),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView(
            children: <Widget>[
              imageProfile(),
              SizedBox(height: 20),
              nameTextField(),
              SizedBox(height: 20),
            ],
          )
        )
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile == null
              ? AssetImage('assets/profile.jfif')
              : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(context: context, builder: ((builder) => bottomSheet()));
              },
              child: Icon(
                Icons.camera_alt,
                color: secondaryTextColor,
                size: 40,
              ),
            )
          )
        ],
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryTextColor,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: primaryTextColor,
        ),
        labelText: 'Name',
        hintText: 'Input your name'
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose Profile photo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera, size: 50,),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text('Camera', style: TextStyle(fontSize: 20),),
              ),
              FlatButton.icon(
                icon: Icon(Icons.photo_library, size: 50,),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text('Gallery', style: TextStyle(fontSize: 20),),
              )
            ],
          )
        ],
      )
    );
  }

  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
