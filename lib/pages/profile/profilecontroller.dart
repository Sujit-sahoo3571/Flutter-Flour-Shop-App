import 'package:get/get.dart';

class ProfileController extends GetxController {
  var friends = [].obs;

  void addFriends(people) {
    friends.add(people);
  }

  void removeFriends(people) {
    friends.remove(people);
  }

  int follower() => friends.length;

  //image picker
  var isProfilePicPathSet = false.obs;
  var profilePicPath = ''.obs;

  void setProfilePicPath(String path) {
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;
  }
}
