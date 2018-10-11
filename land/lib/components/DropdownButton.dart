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

Widget getDropDownButton(form, setState) {
  return DropdownButtonHideUnderline(  
    child: new Padding(
      padding: new EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
      child: InputDecorator(
        decoration: const InputDecoration(
          // labelText: 'Activity',
          // hintText: 'Choose an activity',
          // contentPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 10.0),
          // border: InputBorder.none
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF2FD6D9))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF8FC8C9))),
        ),
        child: DropdownButton(
          items: getListData(),
          hint: new Text('选择证件类型', style: new TextStyle(
            inherit: false, 
            color: Colors.white,
            fontWeight: FontWeight.bold, 
            fontSize: 16.0,
            // decorationColor: Colors.black,
          ),),//当没有默认值的时候可以设置的提示
          value: form['cardType'],//下拉菜单选择完之后显示给用户的值
          onChanged: (T){//下拉菜单item点击之后的回调
            setState(() {
              form['cardType'] = T;
            });
          },
          elevation: 24,//设置阴影的高度
          style: new TextStyle(//设置文本框里面文字的样式
            inherit: false, 
            fontWeight: FontWeight.bold, 
            color: Colors.black,
            // decorationColor: Colors.white,
          ),
          isDense: false,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
          iconSize: 50.0,
        )
      )
    )
  );
}
