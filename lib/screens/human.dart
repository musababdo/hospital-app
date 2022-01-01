
import 'package:doctor/constants.dart';
import 'package:doctor/widgets/FadeAnimation.dart';
import 'package:doctor/widgets/customTextView.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class human extends StatefulWidget {
  static String id = 'human';
  @override
  _humanState createState() => _humanState();
}

class _humanState extends State<human> {

  String _weight, _tall;
  String myfat="null";
  double size;
  bool visibilityCount = false;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'حساب حجم اطار الجسم',
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
      ),
      body: Form(
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
              hint: 'حجم المعصم',
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
                    size = d1 / d2;
                    if (size >=1 && size <=13 ){
                      myfat="خارج النطاق";
                    }else if (size >=14 && size <= 16) {
                      myfat="صغير";
                    }else if (size >= 17 && size <= 19) {
                      myfat="متوسط";
                    }else if (size >= 20) {
                      myfat="كبير";
                    }
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
                    'حجم اطار الجسم',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Text(
                    "${myfat}",
                    style: TextStyle(color: Colors.black, fontSize:25),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
