

import 'package:dro_app/model/drug.dart';
import 'package:dro_app/screens/details.dart';
import 'package:dro_app/utils/navigation/navigator.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  Drug drug;
  Box({this.drug});
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        pushTo(context, Details(drug: drug,));
      },
      child: Material(
        elevation: 3.0,
        child: Container(
          margin: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                  child: Center(child: Image.asset(drug.image))),



              SizedBox(height: 20,),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(drug.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                    Text(drug.desc, style: TextStyle(fontSize: 13,))




                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    height: 25,
                    width: 50,
                    child: Center(child: Text("₦ ${drug.price.toString()}", style: TextStyle(color: Colors.white, fontSize: 10),)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}