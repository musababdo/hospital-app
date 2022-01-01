
import 'package:doctor/constants.dart';
import 'package:doctor/widgets/FadeAnimation.dart';
import 'package:doctor/widgets/customTextView.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class water extends StatefulWidget {
  static String id = 'water';
  @override
  _waterState createState() => _waterState();
}

class _waterState extends State<water> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _weight;
  bool visibilityCount = false;
  String myfat;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
      backgroundColor:kMainColor,
      title: Text(
        'حساب كميه استهلاك الماء',
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
      body:Form(
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
              height: height * .05,
            ),
            GestureDetector(
              onTap:(){
                if (_globalKey.currentState.validate()){
                  _globalKey.currentState.save();
                  try{
                    double d1=double.parse(_weight);
                    double we = d1 * 30 / 1000;
                    final format=new NumberFormat("#,#");
                    myfat=format.format(we);
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
                    'كميه المياه اليوميه الضروريه',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Text(
                    '${myfat} لتر ',
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
