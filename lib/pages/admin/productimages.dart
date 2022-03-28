import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/admin/storage/storage_repository.dart';
import 'package:image_picker/image_picker.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key? key}) : super(key: key);
  static final _sizedbox = SizedBox(
    height: 10.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Product Images")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyFonts(
                  text: "Add Images here ",
                  size: 40.0,
                ),
                _sizedbox,
                _sizedbox,
                Row(
                  children: [
                    customImageContainer(context),
                    customImageContainer(context),
                    customImageContainer(context),
                  ],
                ),
                Row(
                  children: [
                    customImageContainer(context),
                    customImageContainer(context),
                    customImageContainer(context),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customImageContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
      child: Container(
        width: 100.0,
        height: 150.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 1.0)),
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.red,
            ),
            onPressed: () async {
              ImagePicker _picker = ImagePicker();
              final XFile? _image =
                  await _picker.pickImage(source: ImageSource.gallery);

              if (_image == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("No Image was selected "),
                ));
              }

              if (_image != null) {
                print("Uploading.....");
                StorageRepository().uploadImage(_image);
              }
            },
          ),
        ),
      ),
    );
  }
}
