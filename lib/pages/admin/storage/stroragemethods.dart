import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //adding image to firebase storage
  Future<String> uploadImgeToStorage(String childname, Uint8List file) async {
    Reference ref =
        _storage.ref().child(childname).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  // add user to the database
  void addUserToDataBase(String username, String text, String imageUrl) async {
    await _firestore.collection("Users").doc(_auth.currentUser!.uid).set({
      'username': username,
      'bio': text,
      'image': imageUrl,
    });
  }
}
