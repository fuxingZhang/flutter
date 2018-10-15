import 'package:flutter/material.dart';

getTextField(text, form, key) {
  return new Padding(
    padding: new EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
    child: TextField(
      style: new TextStyle(
        height: 1.0,
        fontWeight: FontWeight.bold, 
        color: Colors.black,
      ),
      cursorColor: Color(0xFF2FD6D9),
      decoration: InputDecoration(
        // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF2FD6D9))),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF8FC8C9))),
        contentPadding: EdgeInsets.all(10.0),
        hintText: text,
        hintStyle: new TextStyle(
          fontWeight: FontWeight.bold, 
          color: Colors.white
        )
      ),
      onChanged: (T){
        form[key] = T;
      },
    )
  );
}