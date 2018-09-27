import 'package:flutter/material.dart';

getTextField(text, form, key) {
  return new Padding(
    padding: new EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
    child: TextField(
      style: new TextStyle(
        fontWeight: FontWeight.bold, 
        color: Colors.black
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
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