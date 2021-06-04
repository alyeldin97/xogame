import 'package:flutter/material.dart';

Widget buildButton(String button,{Function onPlay}){

  return Expanded(
    child: Container(
      color: Colors.amberAccent,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(button,style: TextStyle(fontSize: 40),),
        onPressed:onPlay,
      ),
    ),
  );
}