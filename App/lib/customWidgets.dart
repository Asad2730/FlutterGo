

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myTextField({required TextEditingController controllerTxt,required String hintTxt}){
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    child:TextField(
      controller: controllerTxt,
      decoration: InputDecoration(
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )
      ),
    ) ,
  );


}