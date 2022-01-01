
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/sick.dart';

class page4 extends StatefulWidget {
  static String id = 'page4';
  @override
  _page4State createState() => _page4State();
}

class _page4State extends State<page4> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'علاج جرثومه المعده',
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
                Text("-: الإصابة ببكتيريا بيلوري الحلزونية"
                  ,style: TextStyle(fontSize: 25,color: kMainColor),
                ),
                Text("تعيش جرثومة هيليكوباكتر بيلوري (Helicobacter pylori) ضمن عصارة المعدة وتقاوم بيئتها الحمضية القاسية من خلال إفراز إنزيم يوراز (Urease)، وتغزو بكتيريا بيلوري جدار المعدة المخاطي مما يزيد من حساسيته وتأثره سلباً بالعصارة الهضمية مما يؤدي بدوره إلى الإصابة  بالتهاب فاعل ومزمن."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("-: متلازمة زولينجر-إليسون"
                  ,style: TextStyle(fontSize: 25,color: kMainColor),
                ),
                  Text("متلازمة زولينجر إليسون (Zollinger-Ellison syndrome) هي سرطان نادر الحدوث يؤدي إلى فرط في إفراز هرمون الجاسترين الحامضي، تتشابه أعراضها في أعراض القرحة الهضمية التقليدية إلا أنها لا تتجاوب مع العلاجات أو مثبطات الحموضة (Antacids)."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("-: العامل الوراثي"
                  ,style: TextStyle(fontSize: 25,color: kMainColor),
                ),
                  Text("هناك دراسات تفيد بأن العامل الوراثي يلعب دوراً في حدوث القرحة الهضمية خاصة ان كانت في عمر الطفولة."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("-: التدخين"
                  ,style: TextStyle(fontSize: 25,color: kMainColor),
                ),
                  Text("لا يعد التدخين سبباً من أسباب القرحة الهضمية الا انه يعد من العوامل التي تزيد من شدة القرح وتبطئ من تعافيه وتزيد نسبة تكرر القرح بعد تعافيه."
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
