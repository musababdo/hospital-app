
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/sick.dart';

class page2 extends StatefulWidget {
  static String id = 'page2';
  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'أعراض جرثومه المعده',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, sick.id);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: height * .02,
                ),
                Text('-: جرثومة المعدة',style: TextStyle(fontSize: 30,color: kMainColor),),
                SizedBox(
                  height: height * .01,
                ),
                  Text("هي بكتيريا حلزونية الشكل، تعيش وتتكاثر في الجدران المبطنة للمعدة، وهي المسبب للعديد من الأمراض في المعدة بما في ذلك القرحة، حيث أن وجود الجرثومة أحد مسببات القرحة وليس العكس، كما يبقى الشخص مصاب بالعدوى ما لم يخضع للعلاج."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Text("-: مسميات أخرى"
                  ,style: TextStyle(fontSize: 30,color: kMainColor),
                ),
                  Text("الجرثومة الملوية البوابية - البكتيريا الحلزونية - هيليكوباكتر بيلوري"
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text("-: الأسباب"
                  ,style: TextStyle(fontSize: 30,color: kMainColor),
                ),
                  Text("تنتقل للإنسان عن طريق الأطعمة، أو المياه والأواني غير النظيفة، أو الاتصال بلعاب الشخص المصاب أو مشاركة الأواني معه"
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
