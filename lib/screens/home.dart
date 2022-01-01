
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:doctor/screens/profile.dart';
import 'package:doctor/screens/login.dart';
import 'package:doctor/screens/muscle.dart';
import 'package:doctor/screens/water.dart';
import 'package:doctor/screens/human.dart';
import 'package:doctor/screens/date.dart';
import 'package:doctor/screens/calculator.dart';
import 'package:doctor/screens/sick.dart';
import 'package:doctor/screens/doctors.dart';
import 'package:doctor/screens/mydoctor.dart';
import 'package:doctor/screens/location.dart';
import 'package:doctor/screens/reserveandprice.dart';

class home extends StatefulWidget {
  static String id = 'home';
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  String name,phone;
  SharedPreferences preferences;

  Future getUser() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      name=preferences.getString("name");
      phone=preferences.getString("phone") ;
    });
  }

  Future<void> signOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("name");
      preferences.remove("phone");
      preferences.remove("password");
      preferences.remove("id");
      pref.clear();
      Navigator.popAndPushNamed(context, login.id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: kMainColor,
                ),
                accountName: Text(name !=null?name:"Your name here",style: TextStyle(color:Colors.white,fontSize: 20),),
                accountEmail: Text(phone !=null?phone:"Your phone here",style: TextStyle(color:Colors.white,fontSize: 20),),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(children: <Widget>[
                  ListTile(
                    dense: true,
                    title: Text("الملف الشخصي", style: TextStyle(color: Colors.black),),
                    leading: Icon(Icons.person),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context,profile.id);
                    },
                  ),
                  ListTile(
                    dense: true,
                    title: Text("تسجيل خروج", style: TextStyle(color: Colors.black),),
                    leading: Icon(Icons.logout),
                    onTap: (){
                      Navigator.pop(context);
                      signOut();
                      Navigator.pushNamed(context,login.id);
                    },
                  ),

                ],),
              ),
            ]
        ),
      ),
      appBar: AppBar(
        backgroundColor: kMainColor,
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'الرئيسيه',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop:(){
          exitDialog();
          return Future.value(false);
        },
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(4),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, date.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('أحجز موعد',style:TextStyle(fontSize: 20),),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, muscle.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('حساب نسبه الدهون في الجسم',style:TextStyle(fontSize: 17)),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, water.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('حساب كميه استهلاك الماء',style:TextStyle(fontSize: 17)),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, human.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('حساب حجم اطار الجسم',style:TextStyle(fontSize: 17)),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, calculator.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('حساب مؤشر كتله الجسم',style:TextStyle(fontSize: 17)),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, sick.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('أمراض الباطنيه',style:TextStyle(fontSize: 17)),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, mydoctor.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('الاطباء',style:TextStyle(fontSize: 17)),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, reserve.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('الحجز و الأسعار',style:TextStyle(fontSize: 17)),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.popAndPushNamed(context, location.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                elevation: 9,
                child: Center(
                  child: const Text('موقعنا',style:TextStyle(fontSize: 17)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  exitDialog(){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("الخروج من التطبيق"),
            content: Text('هل تود الخروج من التطبيق '),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("لا")
              ),
              FlatButton(
                  onPressed: (){
                    SystemNavigator.pop();
                  },
                  child: Text("نعم")
              ),
            ],
          );
        }
    );
  }
}
