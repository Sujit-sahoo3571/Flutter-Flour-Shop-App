import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/admin/storage/stroragemethods.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  // file
  Uint8List? _image;

  //textcontroller
  final nametext = TextEditingController();

  final statustext = TextEditingController();

  String imageUrl =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

  @override
  void dispose() {
    // TODO: implement dispose
    statustext.dispose();
    nametext.dispose();
    super.dispose();
  }

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
                    _image != null
                        ? CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Colors.grey,
                            backgroundImage: MemoryImage(_image!))
                        : const CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
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
                          onPressed: () async {
                            selectImage();
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
                          controller: nametext,
                          maxLength: 10,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                size: 35.0,
                              ),
                              hintText: "What People Call You?",
                              label: Text("Name * "),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Your Name ";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          maxLength: 20,
                          controller: statustext,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.messenger,
                                size: 35.0,
                              ),
                              hintText: "What's On Your Mind?",
                              label: Text("Status * "),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Something About You ";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100.0, 40.0)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                AuthServices().loginCheck()) {
                              // add user to data base
                              StorageMethods().addUserToDataBase(
                                  nametext.text.toUpperCase(),
                                  statustext.text,
                                  imageUrl);
                              Get.snackbar("Save Data", "Success");
                              _formKey.currentState!.reset();
                              Navigator.of(context).pop();
                            } else if (!AuthServices().loginCheck()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Log In First")));
                            }
                          },
                          child: Text("Save"))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void selectImage() async {
    try {
      Uint8List im = await pickImage(
        ImageSource.gallery,
      );
      setState(() {
        _image = im;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("NO File Selected")));
    }
  }

  pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    XFile? _file = await _picker.pickImage(source: source);
    if (_file != null) {
      var image = await _file.readAsBytes();
      imageUrl =
          await StorageMethods().uploadImgeToStorage("ProfilePics", image);

      return image;
    }

    print("Image not Selected ");
  }
}
