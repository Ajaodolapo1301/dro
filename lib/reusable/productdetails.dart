


import 'package:dro_app/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';

class ProducDetails extends StatelessWidget {
  String images;
  String title;
  String packSize;
  bool rotate;
  ProducDetails({this.title, this.images, this.packSize, this.rotate = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Transform.rotate(
              angle: rotate ? 5.6 :0.0,
              child: Image.asset(images,  height: 30, color: kprimaryColor,)),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey, fontSize: 12, )),
              Text(packSize, style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}