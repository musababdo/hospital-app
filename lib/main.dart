import 'package:doctor/constants.dart';
import 'package:doctor/provider/mudelHud.dart';
import 'package:doctor/screens/calculator.dart';
import 'package:doctor/screens/date.dart';
import 'package:doctor/screens/details.dart';
import 'package:doctor/screens/doctors.dart';
import 'package:doctor/screens/home.dart';
import 'package:doctor/screens/human.dart';
import 'package:doctor/screens/login.dart';
import 'package:doctor/screens/muscle.dart';
import 'package:doctor/screens/mydoctor.dart';
import 'package:doctor/screens/profile.dart';
import 'package:doctor/screens/register.dart';
import 'package:doctor/screens/reserveandprice.dart';
import 'package:doctor/screens/sick.dart';
import 'package:doctor/screens/location.dart';
import 'package:doctor/screens/splashscreen.dart';
import 'package:doctor/screens/water.dart';
import 'package:doctor/sickness/page1.dart';
import 'package:doctor/sickness/page2.dart';
import 'package:doctor/sickness/page3.dart';
import 'package:doctor/sickness/page4.dart';
import 'package:doctor/sickness/page5.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
//              body: Center(
//                child: Text('Loading....'),
//              ),
            ),
          );
        }else {
          isUserLoggedIn = snapshot.data.getBool(kKeepMeLoggedIn) ?? false;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ModelHud>(
                create: (context) => ModelHud(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: isUserLoggedIn ? SplashScreen.id : login.id,
              //initialRoute: MyMap.id,
              routes: {
                SplashScreen.id:(context)=>SplashScreen(),
                login.id:(context)=>login(),
                register.id:(context)=>register(),
                home.id:(context)=>home(),
                profile.id:(context)=>profile(),
                calculator.id:(context)=>calculator(),
                human.id:(context)=>human(),
                muscle.id:(context)=>muscle(),
                water.id:(context)=>water(),
                date.id:(context)=>date(),
                sick.id:(context)=>sick(),
                doctors.id:(context)=>doctors(),
                details.id:(context)=>details(),
                reserve.id:(context)=>reserve(),
                location.id:(context)=>location(),
                mydoctor.id:(context)=>mydoctor(),
                page1.id:(context)=>page1(),
                page2.id:(context)=>page2(),
                page3.id:(context)=>page3(),
                page4.id:(context)=>page4(),
                page5.id:(context)=>page5(),
              },
            ),
          );
        }
      },
    );
  }
}

