
import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final Function onClick;
  final Function myfun;
  final Function showHide;
  bool secure=true;
  String _errorMessage(String str) {
    switch (hint) {
      case 'الاسم':
        return 'الرجاء ادخال الاسم';
      case 'كلمه المرور':
        return 'الرجاء ادخال كلمه المرور';
      case 'الهاتف':
        return 'الرجاء ادخال الهاتف';
      case 'الوزن':
        return 'الرجاء ادخال الوزن';
      case 'الطول':
        return 'الرجاء ادخال الطول';
      case 'العمر':
        return 'الرجاء ادخال العمر';
      case 'حجم المعصم':
        return 'الرجاء ادخال حجم المعصم';
      case 'اسم المريض/المريضه':
        return 'الرجاء ادخال اسم المريض/المريضه';
      case 'عنوان السكن':
        return 'الرجاء ادخال عنوان السكن';
      case 'رقم الهاتف':
        return 'الرجاء ادخال رقم الهاتف';
      case 'فصيله الدم':
        return 'الرجاء ادخال فصيله الدم';
      case 'الاعراض':
        return 'الرجاء ادخال الاعراض';
    }
  }

  CustomTextField({@required this.showHide,@required
  this.myfun,@required this.onClick, @required this.icon,
    @required this.hint, @required this.controller});

  @override
  stateCustom createState() => stateCustom();

}

class stateCustom extends State<CustomTextField>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 9,
        child: TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value.isEmpty) {
              return widget._errorMessage(widget.hint);
              // ignore: missing_return
            }
          },
          onSaved: widget.onClick,
          onTap:widget.myfun,
          obscureText: widget.hint == 'كلمه المرور' ? widget.secure : false,
          keyboardType: widget.hint == 'الهاتف' || widget.hint == 'الوزن' || widget.hint == 'الطول' || widget.hint == 'العمر' || widget.hint == 'حجم المعصم' ? TextInputType.number : TextInputType.text ,
          cursorColor: kMainColor,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: Icon(
              widget.icon,
              color: kMainColor,
            ),
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  widget.secure = !widget.secure;
                });
              },
              icon: Icon(widget.hint == 'كلمه المرور' ? widget.secure
                  ? Icons.visibility_off
                  : Icons.visibility : null),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }

}