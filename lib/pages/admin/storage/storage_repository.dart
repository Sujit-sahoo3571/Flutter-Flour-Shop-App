import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter_flour_shop/pages/admin/storage/base_storage_repository.dart';
import 'package:image_picker/image_picker.dart';

class StorageRepository extends BaseStroageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(XFile image) async {
    try {
      await storage.ref('user_1/${image.name}').putFile(File(image.path));
    } catch (_) {
      print('Error In Storage : $_ ');
    }
  }
}
