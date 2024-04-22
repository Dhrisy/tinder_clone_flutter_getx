import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
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
            SizedBox(
              height: 55.h,
              child: CustomTextFieldWidget(
                editingController: emailEditingController,
                iconData: Icons.email,
                isObscure: false,
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              height: 55.h,
              child: CustomTextFieldWidget(
                editingController: pwEditingController,
                iconData: Icons.lock_outlined,
                isObscure: true,
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            InkWell(
              onTap: () {},
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
        ),
      ),
    ));
  }
}
