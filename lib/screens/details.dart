
import 'dart:convert';
import 'package:doctor/models/Day.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  static String id = 'details';
  final List list;
  final int index;
  details({this.list,this.index});
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {

  String name,image,detail;

  Future<List<Day>> loadDay() async {
    var data = await json.decode(widget.list[widget.index]['days']);
    List<Day> days=[];
    for(var d in data){
      Day day = Day(d["id"], d["name"]);
      days.add(day);
    }
    return days;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name       =  widget.list[widget.index]['name'];
    image      =  widget.list[widget.index]['image'];
    detail     =  widget.list[widget.index]['details'];
    loadDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      height: 300.0,
                      child: new ClipRRect(
                        borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(20),
                          bottomRight: const Radius.circular(20),
                        ),
                        child:Image.network(image,fit:BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    elevation: 9,
                    color: Colors.white,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                            Text(
                              '  :  الاسم',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    elevation: 9,
                    color: Colors.white,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width:  MediaQuery.of(context).size.width ,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '  :  الوصف',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                            ),
                            Text(
                              detail,
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    elevation: 9,
                    color: Colors.white,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width:  MediaQuery.of(context).size.width ,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                              child:Text(
                                '  :  الأيام المتواجد فيها الطبيب',
                                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),
                              )
                            ),
                            Expanded(
                                flex: 8,
                                child:FutureBuilder(
                                  future: loadDay(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot){
                                    if(snapshot.data == null){
                                      return Text("");
                                    } else {
                                      return ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          Day day = snapshot.data[index];
                                          print(day);
                                          return Padding(
                                            padding: const EdgeInsets.only(top:5,bottom: 5),
                                            child: Text(day.name,style:TextStyle(fontSize:18),),
                                          );
                                        },
                                      );
                                    }
                                  },
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.white,
                      child: GestureDetector(
                        onTap:(){
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => Home(),
//                            ),
//                          );
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          child: Icon(Icons.arrow_back,color: Colors.black),
                          height: 32,
                          width: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
