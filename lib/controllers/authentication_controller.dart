import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder_clone_flutter_getx/models/person.dart' as personModel;

class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async {
    print('IMAGE FILE PICKING');
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      print('IMAGE FILE PICKED');
      // provider.setImageFile(imageFile);
      Get.snackbar(
          "Profile imgae", "You have successfully picked your proifle picture");
      Get.back();
    } else {
      print('IMAGE NOT FOUND');
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFileFromCamera() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      Get.snackbar("Profile imgae",
          "You have successfully captured your proifle picture");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  deleteImage() async {
    imageFile = null;
    // pickedFile.value!.deleteSync(recursive: true);
    // pickedFile.value = null;
    Get.snackbar("Profile image", "Profile picture deleted successfully");
  }

  Future<String> uploadImageToStorage(File profileImage) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Imgaes")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(profileImage);
    TaskSnapshot snapshot = await task;
    String downloadUrlOFImage = await snapshot.ref.getDownloadURL();
    return downloadUrlOFImage;
  }

  createNewUserAccount(
    String password,
    File profileImage,
    String name,
    String email,
    String age,
    String phone,
    String city,
    String country,
    String profileHeading,
    String whatAreYouLookingFor,
    int publishedDateTime,

    //apearance
    String height,
    String weight,
    String bodyType,

    //lifestyle
    String drink,
    String smoke,
    String maritalStatus,
    String haveChildren,
    String noOfChildren,
    String profession,
    String employementStatus,
    String relationShipLookingFor,

    // background
    String nationality,
    String education,
    String language,
    String religion,
  ) async {
    try {
      // authenticate user and create user
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          //upload image to firebase
      String urlOfDownloadedImage = await uploadImageToStorage(profileImage);

personModel.Person personInstance = personModel.Person(
  profileImage: urlOfDownloadedImage,
  age: age,
  bodyType: bodyType,
  city: city,
  country: country,
  drink: drink,
smoke: smoke,
education: education,
email: email,
employementStatus: employementStatus,
haveChildren: haveChildren,
height: height,
language: language, 
maritalStatus: maritalStatus,
name: name,
nationality: nationality,
 noOfChildren: noOfChildren,
 password: password,
 phone: phone,
 profession: profession,
 profileHeading: profileHeading,
 publishedDateTime: DateTime.now().millisecondsSinceEpoch,
 relationShipLookingFor: relationShipLookingFor,
 religion: religion,
 weight: weight,
 whatAreYouLookingFor: whatAreYouLookingFor,


);

    } catch (error) {
      Get.snackbar("Someting went wrong", "Error occurred: $error");
    }
  }
}
