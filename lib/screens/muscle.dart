
import 'package:doctor/constants.dart';
import 'package:doctor/widgets/FadeAnimation.dart';
import 'package:doctor/widgets/customTextView.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class muscle extends StatefulWidget {
  static String id = 'muscle';
  @override
  _muscleState createState() => _muscleState();
}

class _muscleState extends State<muscle> {

  int _tabBarIndex = 0;
  String _weight, _tall,_old;
  String _weight1, _tall1,_old1;
  double bmi,fat;
  double bmi1,fat1;
  String myfat;
  String myfat1;
  bool visibilityCount = false;
  bool visibilityCount1 = false;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _globalKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:kMainColor,
          title: Text(
            'حساب نسبه الدهون في الجسم',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.popAndPushNamed(context, home.id);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            indicatorColor: kMainColor,
            onTap: (value) {
              setState(() {
                _tabBarIndex = value;
              });
            },
            tabs: <Widget>[
              Text(
                'ذكر',
                style: TextStyle(
                    color:
                    _tabBarIndex == 0 ? Colors.white : kUnActiveColor,
                    fontSize: _tabBarIndex == 0 ? 16 : null),
              ),
              Text(
                'انثي',
                style: TextStyle(
                    color:
                    _tabBarIndex == 1 ? Colors.white : kUnActiveColor,
                    fontSize: _tabBarIndex == 1 ? 16 : null),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Form(
              key: _globalKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height:20,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      _weight=value;
                    },
                    hint: 'الوزن',
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      _tall=value;
                    },
                    hint: 'الطول',
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      _old=value;
                    },
                    hint: 'العمر',
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  GestureDetector(
                    onTap:(){
                      if (_globalKey.currentState.validate()){
                        _globalKey.currentState.save();
                        try{
                          double d1=double.parse(_weight);
                          double d2=double.parse(_tall);
                          double d3=double.parse(_old);
                          double he=d2/100;
                          bmi = (d1 / (he * he));
                          fat = (1.20 * bmi) + (0.23 * d3) - 16.2;
                          final format=new NumberFormat("#,#");
                          myfat=format.format(fat);
                          setState(() {
                            visibilityCount = true ;
                          });
                        }on PlatformException catch(e){

                        }
                      }
                    },
                    child: FadeAnimation(2, Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ]
                          )
                      ),
                      child: Center(
                        child: Text(
                          'احسب',
                          style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: visibilityCount,
                    child: Column(
                      children: [
                        Text(
                          'نسبه الدهون في الجسم',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        Text(
                          '${myfat} %',
                          style: TextStyle(color: Colors.black, fontSize:25),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Form(
              key: _globalKey1,
              child: ListView(
                children: <Widget>[
                SizedBox(
                height:20,
              ),
                  CustomTextField(
                    onClick: (value) {
                      _weight1=value;
                    },
                    hint: 'الوزن',
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      _tall1=value;
                    },
                    hint: 'الطول',
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      _old1=value;
                    },
                    hint: 'العمر',
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  GestureDetector(
                    onTap:(){
                      if (_globalKey1.currentState.validate()){
                        _globalKey1.currentState.save();
                        try{
                          double d1=double.parse(_weight1);
                          double d2=double.parse(_tall1);
                          double d3=double.parse(_old1);
                          double he=d2/100;
                          bmi1 = (d1 / (he * he));
                          fat1 = (1.20 * bmi1) + (0.23 * d3) - 5.4;
                          final format=new NumberFormat("#,#");
                          myfat1=format.format(fat1);
                          setState(() {
                            visibilityCount1 = true ;
                          });
                        }on PlatformException catch(e){

                        }
                      }
                    },
                    child: FadeAnimation(2, Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ]
                          )
                      ),
                      child: Center(
                        child: Text(
                          'احسب',
                          style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: visibilityCount1,
                  child: Column(
                    children: [
                      Text(
                        'نسبه الدهون في الجسم',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      Text(
                        '${myfat1} %',
                        style: TextStyle(color: Colors.black, fontSize:25),
                      ),
                    ],
                  ),
                )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
