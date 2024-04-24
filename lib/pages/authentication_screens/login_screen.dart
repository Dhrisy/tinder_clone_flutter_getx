import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tinder_clone_flutter_getx/controllers/authentication_controller.dart';
import 'package:tinder_clone_flutter_getx/custon_functions/email_validation.dart';
import 'package:tinder_clone_flutter_getx/pages/authentication_screens/create_account_screen.dart';
import 'package:tinder_clone_flutter_getx/widgets/custom_text_field_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController pwEditingController = TextEditingController();
  bool showProgressBar = false;
  var authController = AuthenticationController();
  final _formKey = GlobalKey<FormState>();
  var customFunctions = CustomFunctions();
  ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: ValueListenableBuilder(
          valueListenable: loadingNotifier,
          builder: (context, _isLoading, _) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Please login to find your best Match',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 28.h,
                ),
               Form(
                key: _formKey,
                 child: Column(
                  children: [
                     CustomTextFieldWidget(
                       editingController: emailEditingController,
                       iconData: Icons.email,
                       isObscure: false,
                       labelText: 'Email',
                       keyboardType: TextInputType.emailAddress,
                       validator: (_){
                          if (emailEditingController.text.trim() == "") {
                                   return "Email is required";
                                 } else {
                                   final res = customFunctions.emailValidation(emailEditingController.text);
                                   return res;
                                 }
                       },
                     ),
                  const SizedBox(
                    height: 28,
                  ),
                  // CupertinoTextField(
                  //   suffix: Icon(CupertinoIcons.eye_slash),
                  //   suffixMode: OverlayVisibilityMode.editing,
                    
                  // ),
                  CustomTextFieldWidget(
                    
                    editingController: pwEditingController,
                    iconData: Icons.lock_outlined,
                    isObscure: true,
                    labelText: 'Password',
                    // suffixIcon: CupertinoIcons.eye_slash,
                     validator: (_) {
                              if (pwEditingController.text.trim() == "") {
                                return " Password is required";
                              } else {
                                if (pwEditingController.text.length < 6) {
                                  return "Password must contain 6 characters";
                                }
                              }
                            },
                  ),
                  
                  ],
                 ),
               ),
               const SizedBox(
                  height: 28,
                ),
                InkWell(
                  onTap: () async{
                    if(_formKey.currentState!.validate()){
            loadingNotifier.value= true;
                      Future.delayed(Duration(seconds: 2));
                      await authController.loginExistingAccount(
                        emailEditingController.text, 
                        pwEditingController.text);

                        loadingNotifier.value = false;
                        emailEditingController.clear();
                        pwEditingController.clear();
                        // Get.to(CreateAccountScreen());
            
            
            
                    }
                  },
                  child: Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 18.w,),
                                      loadingNotifier.value
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
                SizedBox(
                  height: 10.h,
                ),
            
                //create account button here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          // color: Colors.black,
                          // fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(CreateAccountScreen());
                      },
                      child: const Text(
                        "Create here",
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
                    : SizedBox.shrink()
              ],
            );
          }
        ),
      ),
    ));
  }
}
