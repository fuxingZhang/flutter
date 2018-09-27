import 'package:flutter/material.dart';

List<DropdownMenuItem> getListData(){
  Map map = {
    '1': '居民身份证',
    '2': '军官证',
    '3': '行政、企事业单位机构代码证或法人代码证',
    '4': '户口簿',
    '5': '护照',
    '6': '其他证件',
  };
  List<DropdownMenuItem> items = new List();
  map.forEach((key, value) {
    items.add(new DropdownMenuItem(
      child:new Text(value),
      value: key,
    ));
  });

  return items;
}