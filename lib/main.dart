import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobseekingapp/controller/signup_controller.dart';
import 'package:jobseekingapp/model/usermodel.dart';
import 'package:jobseekingapp/screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UsermodelAdapter());
  final a = Hive.openBox<Usermodel>("usermodel");
  await Hive.openBox<Usermodel>('usermodel');
  //Get.put(SignupController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Job Seeking App',
      debugShowCheckedModeBanner: false,
      home: Frontpage(),
    );
  }
}

class Frontpage extends StatefulWidget {
  const Frontpage({Key? key}) : super(key: key);

  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  //sharefpref get function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.white,
        duration: 2000,
        splash: Padding(
          padding: const EdgeInsets.symmetric(vertical: 180),
          child: Column(children: [
            Image.asset("assets/images/logo1.jpg"),
            Text(
              "Tasker",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
        splashIconSize: double.infinity,
        nextScreen: SignUp(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
