
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/sick.dart';

class page1 extends StatefulWidget {
  static String id = 'page1';
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'أعراض المراره',
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
                Text('-: المراره',style: TextStyle(fontSize: 30,color: kMainColor),),
                SizedBox(
                  height: height * .01,
                ),
                Text("المرارة هي عضو يشبه في شكله الكمثرى موجود أسفل الكبد، ويعمل بشكل رئيسي على تخزين نوع خاص من العصارة اسمها عصارة المرارة (Bile). يتم إنتاج عصارة المرارة عادة في الكبد، ومن هناك يتم إرسالها إلى المرارة حيث يتم تخزينها إلى أن تصبح الأمعاء بحاجتها، عندها تنطلق هذه العصارة من المرارة إلى الأمعاء عبر القناة الكيسية (Cystic duct) لتساعد على إتمام عملية الهضم بشكل سليم يحصل التهاب المرارة عندما تصاب القناة الكيسية بانسداد ما، وغالبًا ما يكون السبب في انسدادات القناة الكيسية أمور مثل حصوات المرارة. يتسبب الانسداد الحاصل بالتهاب المرارة وتورمها مما قد يؤدي بدوره إلى بدء تسرب العصارة الصفراوية إلى الأمعاء والشعور بالام وليونة غير معهودة في المنطقة الوسطى من البطن أو في الجزء الأيمن من البطن."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Text("-: أمراض المراره"
                  ,style: TextStyle(fontSize: 30,color: kMainColor),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text("-: حصى المرارة"
                  ,style: TextStyle(fontSize: 25,color: Colors.black),
                ),
                  Text("حصى المرارة تنتج من خلال المرارة (Gallbladder) وهي عبارة عن كيس صغير موجود تحت الكبد مباشرة.يخزن كيس المرارة في داخله عصارة المرارة (الصفراء - Bilis / bile) التي ينتجها الكبد. تساعد عصارة المرارة.."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text("-: التهاب المرارة"
                  ,style: TextStyle(fontSize: 25,color: Colors.black),
                ),
                  Text("المرارة (Cystis fellea) هي أشبه بكيس يبلغ طوله نحو 10 سم يتواجد على السطح السفلي للكبد.تتمثل وظيفة المرارة في تركيز الصفراء (عصارة المرارة - bile) التي يفرزها الكبد، وذلك بواسطة امتصاص الماء.."
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
