import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder_clone_flutter_getx/models/person.dart' as personModel;
import 'package:tinder_clone_flutter_getx/pages/authentication_screens/create_account_screen.dart';
import 'package:tinder_clone_flutter_getx/pages/authentication_screens/login_screen.dart';
import 'package:tinder_clone_flutter_getx/pages/home/home_screen.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();

  late Rx<User?> firebaseCurrentUser;

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

  loginExistingAccount(String email, String password) async {
    try {
      // authenticate user and login user
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

          Get.to(HomeScreen());
    } catch (error) {
      Get.snackbar("Login successfull", "Error occured $error");
    }
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
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
                

      //upload image to firebase
      String urlOfDownloadedImage = await uploadImageToStorage(profileImage);

      personModel.Person personInstance = personModel.Person(
        uid: FirebaseAuth.instance.currentUser!.uid,
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
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());
    } catch (error) {
 // Handle specific errors if needed
      if (error is FirebaseAuthException) {
        // FirebaseAuthException
        Get.snackbar("Authentication Error", error.message!);
      } else {
        // General error
        Get.snackbar("Something went wrong", "Error occurred: $error");
      }    }
  }

checkUserLoggedIn(User? currentUser) async{
if(currentUser == null){
  //need to login up
  Get.to(() => const LoginScreen());

}else{
  // user is logged in send to home
  Get.to(() => const HomeScreen());
}
  }
  @override
  void onReady() {
    
    super.onReady();
    firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(firebaseCurrentUser, checkUserLoggedIn);
  }
}
