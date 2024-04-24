import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tinder_clone_flutter_getx/constants/colors.dart';
import 'package:tinder_clone_flutter_getx/controllers/authentication_controller.dart';
import 'package:tinder_clone_flutter_getx/models/person.dart';
import 'package:tinder_clone_flutter_getx/pages/home/home_screen.dart';
import 'package:tinder_clone_flutter_getx/widgets/custom_text_field_widgets.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  //personal info
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController pwEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController countryEditingController = TextEditingController();
  TextEditingController profileHeadingEditingController =
      TextEditingController();
  TextEditingController lookingForPartnerEditingController =
      TextEditingController();

  //apearance
  TextEditingController heightEditingController = TextEditingController();
  TextEditingController weightEditingController = TextEditingController();
  TextEditingController bodyTypeEditingController = TextEditingController();

  //lifesyle
  TextEditingController drinkEditingController = TextEditingController();
  TextEditingController smokeEditingController = TextEditingController();
  TextEditingController martialStatusEditingController =
      TextEditingController();
  TextEditingController haveChildrenEditingController = TextEditingController();
  TextEditingController noOfChildrenEditingController = TextEditingController();
  TextEditingController professionEditingController = TextEditingController();
  TextEditingController employmentStatusEditingController =
      TextEditingController();
  TextEditingController livingSituationEditingController =
      TextEditingController();
  TextEditingController relationshipLookingForEditingController =
      TextEditingController();

  //background
  TextEditingController nationalityEditingController = TextEditingController();
  TextEditingController educationEditingController = TextEditingController();
  TextEditingController languageEditingController = TextEditingController();
  TextEditingController religionEditingController = TextEditingController();
  TextEditingController ethnicityEditingController = TextEditingController();

  final vertialSpace = SizedBox(
    height: 24.h,
  );
  bool showProgressBar = false;
  final _formKey = GlobalKey<FormState>();
  var authenticationController = AuthenticationController.authController;
  final ValueNotifier<bool> notifier = ValueNotifier(false);

//function to validate emil
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && (regex.hasMatch(value) == true)
        ? null
        : 'Enter a valid email address';
  }

  void clearTextFields() {
    nameEditingController.clear();
    pwEditingController.clear();
    emailEditingController.clear();
    ageEditingController.clear();
    phoneEditingController.clear();
    professionEditingController.clear();
    profileHeadingEditingController.clear();
    martialStatusEditingController.clear();
    relationshipLookingForEditingController.clear();
    lookingForPartnerEditingController.clear();
    noOfChildrenEditingController.clear();
    haveChildrenEditingController.clear();
    nationalityEditingController.clear();
    religionEditingController.clear();
    languageEditingController.clear();
    heightEditingController.clear();
    weightEditingController.clear();
    bodyTypeEditingController.clear();
    cityEditingController.clear();
    countryEditingController.clear();
    drinkEditingController.clear();
    smokeEditingController.clear();
    employmentStatusEditingController.clear();
    educationEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Create Account',
                          style: TextStyle(fontSize: 22.sp),
                        ),
                        vertialSpace,
                        SizedBox(
                          height: 120.h,
                          width: double.infinity,
                          // color: Colors.green,
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  authenticationController.imageFile == null
                                      ? CircleAvatar(
                                          radius: 60.r,
                                          backgroundImage: const AssetImage(
                                              'assets/images/profile_avatar.jpg'),
                                        )
                                      : CircleAvatar(
                                          radius: 60.r,
                                          backgroundImage: FileImage(File(
                                              authenticationController
                                                  .imageFile!.path)),
                                        )
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    _pickOptionBottomSheet(context);
                                  },
                                  child: Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(71, 222, 221, 221),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.edit),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        vertialSpace,
                        const Text('Personal Info:'),
                        vertialSpace,
                        //name
                        CustomTextFieldWidget(
                          editingController: nameEditingController,
                          labelText: "Name",
                          iconData: Icons.person_outlined,
                          isObscure: false,
                          keyboardType: TextInputType.text,
                          validator: (_) {
                            if (nameEditingController.text.trim() == "") {
                              return "Name is required";
                            }
                          },
                        ),
                        vertialSpace,

                        //email
                        CustomTextFieldWidget(
                          editingController: emailEditingController,
                          labelText: "Email",
                          iconData: Icons.email,
                          isObscure: false,
                          keyboardType: TextInputType.emailAddress,
                          // validator: (_) {
                          //   if (emailEditingController.text.trim() == "") {
                          //     return "Email is required";
                          //   } else {
                          //     final res =
                          //         validateEmail(emailEditingController.text);
                          //     return res;
                          //   }
                          // },
                        ),
                        vertialSpace,
                        //password
                        CustomTextFieldWidget(
                          editingController: pwEditingController,
                          labelText: "Password",
                          iconData: Icons.lock_outline,
                          isObscure: true,
                          // validator: (_) {
                          //   if (pwEditingController.text.trim() == "") {
                          //     return " Password is required";
                          //   } else {
                          //     if (pwEditingController.text.length < 6) {
                          //       return "Password must contain 6 characters";
                          //     }
                          //   }
                          // },
                        ),
                        vertialSpace,
                        //age
                        CustomTextFieldWidget(
                          editingController: ageEditingController,
                          labelText: "Age",
                          iconData: Icons.tag,
                          isObscure: false,
                          keyboardType: TextInputType.number,
                          // validator: (_) {
                          //   if (ageEditingController.text.trim() == "") {
                          //     return "Age is required";
                          //   }
                          //   // else if (ageEditingController.text.length < 18) {
                          //   //   return "Age should be greater than or equal to 18";
                          //   // } else if (ageEditingController.text.length > 60) {
                          //   //   return "Age should be less than or equl to 60";
                          //   // }
                          // },
                        ),
                        vertialSpace,
                        //phone
                        CustomTextFieldWidget(
                          editingController: phoneEditingController,
                          labelText: "Phone",
                          iconData: Icons.phone,
                          isObscure: false,
                          keyboardType: TextInputType.number,
                          // validator: (_) {
                          //   if (phoneEditingController.text.trim() == "") {
                          //     return "Phone number is required";
                          //   } else if (phoneEditingController.text.length <
                          //       10) {
                          //     return "Phone number must contain 10 numbers";
                          //   } else if (phoneEditingController.text.length >
                          //       10) {
                          //     return "Please enter a valid phone number";
                          //   }
                          // },
                        ),
                        vertialSpace,
                        //city
                        CustomTextFieldWidget(
                          editingController: cityEditingController,
                          labelText: "City",
                          iconData: Icons.location_city_outlined,
                          isObscure: false,
                        ),
                        vertialSpace,
                        //country
                        CustomTextFieldWidget(
                          editingController: countryEditingController,
                          labelText: "Country",
                          iconData: Icons.location_city,
                          isObscure: false,
                        ),
                        vertialSpace,
                        //profile heading
                        CustomTextFieldWidget(
                          editingController: profileHeadingEditingController,
                          labelText: "Profile Heading",
                          iconData: Icons.text_fields,
                          isObscure: false,
                        ),
                        vertialSpace,
                        //looking for in an partner
                        CustomTextFieldWidget(
                          editingController: lookingForPartnerEditingController,
                          labelText: "What are you looking for in a partner",
                          iconData: Icons.face,
                          isObscure: false,
                        ),

                        vertialSpace,
                        Text(
                          'Appearance',
                          style: TextStyle(fontSize: 22.sp),
                        ),
                        vertialSpace,
                        //height
                        CustomTextFieldWidget(
                          editingController: heightEditingController,
                          labelText: "Height",
                          iconData: Icons.insert_chart,
                          isObscure: false,
                          keyboardType: TextInputType.number,
                          // validator: (_) {
                          //   if (heightEditingController.text.trim() == "") {
                          //     return "Height is required";
                          //   }
                          // },
                        ),
                        vertialSpace,
                        //weight
                        CustomTextFieldWidget(
                          editingController: weightEditingController,
                          labelText: "Weight",
                          iconData: Icons.table_chart,
                          isObscure: false,
                          keyboardType: TextInputType.number,
                          // validator: (_) {
                          //   if (weightEditingController.text.trim() == "") {
                          //     return "Weight is required";
                          //   }
                          // },
                        ),
                        vertialSpace,

                        //body type
                        CustomTextFieldWidget(
                          editingController: bodyTypeEditingController,
                          labelText: "Body type",
                          iconData: Icons.type_specimen,
                          isObscure: false,
                        ),
                        vertialSpace,

                        Text(
                          'Life style',
                          style: TextStyle(fontSize: 22.sp),
                        ),
                        vertialSpace,
                        //drink
                        CustomTextFieldWidget(
                          editingController: drinkEditingController,
                          labelText: "Drink",
                          iconData: Icons.no_drinks,
                          isObscure: false,
                        ),
                        vertialSpace,
                        //smoke
                        CustomTextFieldWidget(
                          editingController: smokeEditingController,
                          labelText: "Smoke",
                          iconData: Icons.smoke_free_outlined,
                          isObscure: false,
                        ),
                        vertialSpace,
                        //marital status
                        CustomTextFieldWidget(
                          editingController: martialStatusEditingController,
                          labelText: "Marital status",
                          iconData: CupertinoIcons.person_2,
                          isObscure: false,
                          // validator: (_) {
                          //   if (martialStatusEditingController.text.trim() ==
                          //       "") {
                          //     return "Marital status is required";
                          //   }
                          // },
                        ),
                        vertialSpace,

                        //haveChildren
                        CustomTextFieldWidget(
                          editingController: haveChildrenEditingController,
                          labelText: "Have children",
                          iconData: CupertinoIcons.person_3_fill,
                          isObscure: false,
                        ),
                        vertialSpace,
                        //no of children
                        CustomTextFieldWidget(
                          editingController: noOfChildrenEditingController,
                          labelText: "Number of children",
                          iconData: CupertinoIcons.person_3_fill,
                          isObscure: false,
                        ),
                        vertialSpace,
                        //profession
                        CustomTextFieldWidget(
                          editingController: professionEditingController,
                          labelText: "Profession",
                          iconData: Icons.business_center,
                          isObscure: false,
                        ),
                        vertialSpace,
                        //employemnet status
                        CustomTextFieldWidget(
                          editingController: employmentStatusEditingController,
                          labelText: "Employement status",
                          iconData:
                              CupertinoIcons.rectangle_stack_person_crop_fill,
                          isObscure: false,
                          // validator: (_) {
                          //   if (employmentStatusEditingController.text.trim() ==
                          //       "") {
                          //     return "Employment status is required";
                          //   }
                          // },
                        ),
                        vertialSpace,

                        //realtionship looking for
                        CustomTextFieldWidget(
                          editingController:
                              relationshipLookingForEditingController,
                          labelText: "Realtionship looking for...",
                          iconData: CupertinoIcons.person,
                          isObscure: false,
                          // validator: (_) {
                          //   if (relationshipLookingForEditingController.text
                          //           .trim() ==
                          //       "") {
                          //     return "This field is required";
                          //   }
                          // },
                        ),
                        vertialSpace,
                        Text(
                          'Background - cultural values',
                          style: TextStyle(fontSize: 22.sp),
                        ),
                        vertialSpace,
                        //nationality
                        CustomTextFieldWidget(
                          editingController: nationalityEditingController,
                          labelText: "Nationality",
                          iconData: Icons.flag_circle_outlined,
                          isObscure: false,
                        ),

                        vertialSpace,
                        //education
                        CustomTextFieldWidget(
                          editingController: educationEditingController,
                          labelText: "Education",
                          iconData: Icons.history_edu,
                          isObscure: false,
                          // validator: (_) {
                          //   if (educationEditingController.text.trim() == "") {
                          //     return "Education is required";
                          //   }
                          // },
                        ),
                        vertialSpace,

                        //language
                        CustomTextFieldWidget(
                          editingController: languageEditingController,
                          labelText: "Language",
                          iconData: Icons.language_outlined,
                          isObscure: false,
                          // validator: (_) {
                          //   if (languageEditingController.text.trim() == "") {
                          //     return "Language is required";
                          //   }
                          // },
                        ),
                        vertialSpace,
                        //religion
                        CustomTextFieldWidget(
                          editingController: religionEditingController,
                          labelText: "Religion",
                          iconData: CupertinoIcons.checkmark_seal_fill,
                          isObscure: false,
                          // validator: (_) {
                          //   if (religionEditingController.text.trim() == "") {
                          //     return "Religion is required";
                          //   }
                          // },
                        ),

                        SizedBox(
                          height: 90.h,
                        ),

                        //login account button here
                      ],
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ValueListenableBuilder(
                  valueListenable: notifier,
                  builder: (context, isLoading, _) {
                    return Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.r),
                                topRight: Radius.circular(8.r)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3.r,
                                  offset: const Offset(0, -1))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (authenticationController.imageFile !=
                                      null) {
                                    if (_formKey.currentState!.validate()) {
                                      notifier.value = true;
                                      // setState(() {
                                      //   showProgressBar = true;
                                      // });
                                      print('SUCCESS ----------->>>');
                                      await authenticationController
                                          .createNewUserAccount(
                                              pwEditingController.text,
                                              authenticationController
                                                  .profileImage!,
                                              nameEditingController.text,
                                              emailEditingController.text,
                                              ageEditingController.text,
                                              phoneEditingController.text,
                                              cityEditingController.text,
                                              countryEditingController.text,
                                              profileHeadingEditingController
                                                  .text,
                                              lookingForPartnerEditingController
                                                  .text,
                                              heightEditingController.text,
                                              weightEditingController.text,
                                              bodyTypeEditingController.text,
                                              drinkEditingController.text,
                                              smokeEditingController.text,
                                              martialStatusEditingController
                                                  .text,
                                              haveChildrenEditingController
                                                  .text,
                                              noOfChildrenEditingController
                                                  .text,
                                              professionEditingController.text,
                                              employmentStatusEditingController
                                                  .text,
                                              relationshipLookingForEditingController
                                                  .text,
                                              nationalityEditingController.text,
                                              educationEditingController.text,
                                              languageEditingController.text,
                                              religionEditingController.text);
                                      // setState(() {
                                      //   showProgressBar = false;
                                      // });
                                      notifier.value = false;
                                      Get.snackbar("Success",
                                          "Profile created successfully");
                                      clearTextFields();
                                      // Get.to(HomeScreen());
                                    }
                                  } else {
                                    Get.snackbar("Image file is missing",
                                        "Please pick image from gallery or camera");
                                  }
                                },
                                child: Container(
                                  height: 45.h,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Create',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 18.w,),
                                      notifier.value
                                          ? SizedBox(
                                              height: 20.h,
                                              width: 22.w,
                                              child:
                                                  const CircularProgressIndicator(
                                                color: Colors.red,
                                              ),
                                            )
                                          : SizedBox.shrink()
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account? ",
                                    style: TextStyle(
                                        // color: Colors.black,
                                        // fontSize: 22.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                      // Get.to(LoginScreen());
                                    },
                                    child: const Text(
                                      "Login in",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          // fontSize: 22.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              showProgressBar == true
                                  ? SizedBox(
                                      height: 20.h,
                                      width: 20.w,
                                      child: const CircularProgressIndicator(
                                        color: Colors.red,
                                      ),
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                        ));
                  }),
            )
          ],
        )),
      ),
    );
  }

  _pickOptionBottomSheet(BuildContext context) {
    return Get.bottomSheet(Container(
      height: 150.h,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          vertialSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile photo',
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                width: 28.w,
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                    authenticationController.deleteImage();
                    setState(() {
                      authenticationController.imageFile;
                    });
                  },
                  child: const Icon(CupertinoIcons.delete))
            ],
          ),
          vertialSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      Get.back();
                      await authenticationController
                          .captureImageFileFromCamera();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    child: Icon(
                      CupertinoIcons.camera,
                      size: 32.sp,
                      color: iconColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text('Camera')
                ],
              ),
              SizedBox(
                width: 28.w,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      Get.back();
                      await authenticationController.pickImageFileFromGallery();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    child: Icon(CupertinoIcons.photo,
                        size: 32.sp, color: iconColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text('Gallery')
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
