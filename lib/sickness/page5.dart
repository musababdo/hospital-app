
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/sick.dart';

class page5 extends StatefulWidget {
  static String id = 'page5';
  @override
  _page5State createState() => _page5State();
}

class _page5State extends State<page5> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kMainColor,
        title: Text(
          'أسباب وجع المعده',
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
                Text("-: الأمراض الفيروسية"
                  ,style: TextStyle(fontSize: 25,color: kMainColor),
                ),
                  Text(" تسببها الفيروسات، وليس هناك حاجة إلى أخذ المضادات الحيوية لأنها لا تقتل الفيروسات وانما البكتيريا فقط. الأمراض الفيروسية قد يعبر عنها بالام بسيطة في البطن أو ألم المعدة مع قيء وإسهال خاصة المائي. عادة ما تزول الام البطن هذه في غضون بضعة أيام."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("-: مشاكل القرحة، تهيج المعدة أو المريء"
                  ,style: TextStyle(fontSize: 25,color: kMainColor),
                ),
                  Text("عادة ما يتم التعبير عن هذه المشاكل بالشعور بالحرقان أو بألم حارق في الجزء العلوي من البطن، الام المعدة في هذه الحالة ترتبط عادة بالطعام وتكون مصحوبة أحيانا بالشعور بالحرقة."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("-: مشاكل المرارة"
                  ,style: TextStyle(fontSize: 25,color: kMainColor),
                ),
                  Text("عادة ما يكون الألم في الجزء الأيمن العلوي من البطن، ويظهر بعد تناول وجبات الطعام ويرافقها الغثيان. هذا الألم شائع لدى الأشخاص الذين يعانون من حصى المرارة."
                  ,style: TextStyle(fontSize: 20,color: Colors.black),
                ),
                Text("-: التسمم الغذائي"
                  ,style: TextStyle(fontSize: 25,color: kMainColor),
                ),
                  Text("الأغذية الفاسدة أو الملوثة تؤدي لالام المعدة، التي يرافقها قيء وفي بعض الأحيان ارتفاع في درجة الحرارة. تظهر الأعراض في غضون ساعات قليلة من تناول الأغذية الفاسدة."
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
