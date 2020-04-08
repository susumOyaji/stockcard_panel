import 'package:flutter/material.dart';
//mport 'main.dart';

//Parsonal Data Disp
class PortFolio extends StatelessWidget {
  PortFolio(
      {this.portassetPrice,
      this.portassetTotal,
      this.portassetvalue,
      this.signal});
  final String portassetPrice;
  final String portassetTotal;
  final String portassetvalue;
  final bool signal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
              backgroundColor:
                  signal ? Colors.red : Colors.green, //Colors.green,
            ),
            label: Text(
              '損益: ${portassetvalue}' +
                  '  時価総額:${portassetPrice}' +
                  '  投資総額:${portassetTotal}',
              //style: new TextStyle(fontFamily: 'RobotoMono',fontSize: 10.0),),
              style: TextStyle(
                  color: Colors.orange /*(0XFFACACAE)*/,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
