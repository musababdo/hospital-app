
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/sick.dart';

class page3 extends StatefulWidget {
  static String id = 'page3';
  @override
  _page3State createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'علاج غازات البطن',
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
                  Text("وجود الغازات في الجهاز الهضمي يتعلق بعدة مصادر إضافية: انتشار (Diffusion) الغاز من تيّار الدم إلى الجهاز الهضمي، الإنتاج بواسطة بكتيريا الأمعاء والتفاعل الكيماوي بين البيكربونات (Bicarbonate - مادة قاعدية) وبين الحامض الذي ينتج في المعدة. يتم إخراج الغاز من الجهاز الهضمي بواسطة التجشؤ، خروج الهواء من فتحة الشرج، الامتزاز (تراكم ذرات أو جزيئات على سطح المادة - Adsorption) بواسطة بكتيريا الأمعاء والانتشار رجوعا إلى تيار الدم."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Text("-: انواع الغازات"
                  ,style: TextStyle(fontSize: 30,color: kMainColor),
                ),
                Text("النيتروجين"
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("الأكسجين"
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("ثاني أكسيد الكربون"
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("الهيدروجين"
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text("-: علاج الغازات"
                  ,style: TextStyle(fontSize: 30,color: kMainColor),
                ),
                Text("-: تغيير النظام الغذائي"
                  ,style: TextStyle(fontSize: 25,color: Colors.black),
                ),
                Text("لمنع تكوّن الغازات لا يساعد، بشكل عام، إلا في حالة المصابين بعدم تحمل سكر الحليب أو سكر الفاكهة.  يتوفر في الأسواق بديل لإنزيم لاكتاز (Lactase)."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("-: الأدوية لإرخاء العضلات الملساء"
                  ,style: TextStyle(fontSize: 25,color: Colors.black),
                ),
                Text("(العضلات اللا إرادية - Smooth muscle)، والتي يعطى بعضها في حالات القولون المتهيج التي تكون الشكوى الرئيسية فيها من أوجاع في البطن، يمكنها إبطاء وتثبيط حركة الأمعاء، لكنها تزيد بالمقابل من الشعور بالانتفاخ. المواد المسرّعة للحركية، مثل السيسابريد (Cisapride)، مِيتوكلوبراميد (Metoclopramide)، تمت تجربتها بنجاح، لكن غير تام. وثمة دواء جديد في هذه المجموعة هو التيجاسيرود (Tegaserod)"
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
