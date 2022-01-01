import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {

  MyDialog({Key key, this.mlocation}) : super(key: key);
  TextEditingController mlocation=new TextEditingController();

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {

  final bloodgroup=["A+","A-","B+","B-","AB+","AB-","O+","O-"];

  var items = List<String>();

  @override
  void initState() {
    // TODO: implement initState
    items.addAll(bloodgroup);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: GestureDetector(
                      onTap:(){
                        widget.mlocation.text=items[index];
                        Navigator.of(context).pop();
                      },
                      child: Text('${items[index]}'
                      ),
                    )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}