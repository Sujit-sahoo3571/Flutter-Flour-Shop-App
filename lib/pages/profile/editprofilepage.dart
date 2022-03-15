import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/profile/profilecontroller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());
  EditProfile({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  // file
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Your Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Obx(
                      () =>

                          // child:
                          CircleAvatar(
                        radius: 60.0,
                        backgroundColor: Colors.grey,
                        backgroundImage: _profileController
                                    .isProfilePicPathSet.value ==
                                true
                            ? FileImage(File(
                                    _profileController.profilePicPath.value))
                                as ImageProvider
                            : AssetImage("assets/images/manwoman/profilepic.png"),
                       
                      ),
                    ),
                    Positioned(
                        left: 60.0,
                        bottom: 10.0,
                        child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 40.0,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            showCameraOption(context);
                          },
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                size: 35.0,
                              ),
                              hintText: "What People Call You?",
                              label: Text("Name * "),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          onSaved: (String? status) {
                            // _profileController.saveForm("cool", status);
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.messenger,
                                size: 35.0,
                              ),
                              hintText: "What's On Your Mind?",
                              label: Text("Status * "),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100.0, 40.0)),
                          onPressed: () {},
                          child: Text("Save"))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showCameraOption(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              SizedBox(
                height: 80.0,
                child: ListTile(
                  onTap: () {
                    takePhoto(ImageSource.gallery);                 
                  },
                  leading: Icon(Icons.photo, size: 50.0),
                  title: Text("Gallery"),
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     takePhoto(ImageSource.camera);
              //     // Navigator.of(context).pop();
              //   },
              //   leading: Icon(Icons.photo_camera),
              //   title: Text("Camera"),
              // ), // Not Working Properly for Now !
            ],
          );
        });
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 50);
    if (pickedImage == null) return;
    pickedFile = File(pickedImage.path);
    _profileController.setProfilePicPath(pickedFile!.path);
    Get.back();
  }
}
