import 'package:flutter/material.dart';
//import 'dart:async';
//import 'main.dart';
//import 'ViewModel/Finance.dart';

//Nikkey And NewYork Dow Display
class MaketStandard extends StatelessWidget {
  MaketStandard({this.presentValue, this.changePriceRate, this.changePriceValue});
  final List<String> presentValue;
  final List<String> changePriceRate;
  final List<String> changePriceValue;

  //MaketStandard({this.stdwidgets});
  //final List<Price> stdwidgets;// = new List.generate(2, (index) => index);
  //stdwidgets[0].polar ?? false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(
            //key: chipKey,
            backgroundColor: Color(0XFF8069A1),
            elevation: 10,
            shadowColor: Colors.black,
            //padding: EdgeInsets.all(10),
            avatar: CircleAvatar(
              maxRadius: 8.0,
              backgroundColor: Colors.green,
            ),
            label: Text('NY Dow:${presentValue[1]}' + '前日比 :${changePriceRate[1]}' + '変動率 :${changePriceValue[1]}',
              //style: new TextStyle(fontFamily: 'RobotoMono',fontSize: 10.0),),
              style: TextStyle(color: Color(0XFFACACAE),fontSize: 10.0,fontWeight: FontWeight.bold),
            ),
          ),
          Chip(
            //key: chipKey,
            backgroundColor: Color(0XFF8069A1),
            elevation: 10,
            shadowColor: Colors.black,
            //padding: EdgeInsets.all(10),
            avatar: CircleAvatar(
              maxRadius: 8.0,
              backgroundColor: Colors.green,
            ),
            label: Text('Nikkei :${presentValue[0]}' /*+'前日比 :${changePriceRate[0]}'*/ +'   ' + '前日比 :${changePriceValue[0]}',
              //style: new TextStyle(fontFamily: 'RobotoMono',fontSize: 10.0),),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
} //market
