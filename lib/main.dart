import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tinder_clone_flutter_getx/controllers/authentication_controller.dart';
import 'package:tinder_clone_flutter_getx/pages/authentication_screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp().then((value) async{
Get.put(AuthenticationController());
await Hive.initFlutter();

});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        title: 'Dating app',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
