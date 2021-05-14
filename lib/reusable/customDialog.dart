

import 'package:dro_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, title, image, description, buttonText),
    );
  }
}

dialogContent(BuildContext context, title, image, buttonText, description) {

  return Stack(
    children: <Widget>[
      //...bottom card part,
      Container(
        padding: EdgeInsets.only(
          top: Consts.avatarRadius + Consts.padding,
          bottom: Consts.padding,
          left: Consts.padding,
          right: Consts.padding,
        ),
        margin: EdgeInsets.only(top: Consts.avatarRadius),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Container(
          height: 180,
          child: Column(
//          mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Order())); // To close the dialog
                  },
                  child: Container(
                      width: 140,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green
                      ),
                      child: Center(child: Text(buttonText, style: TextStyle(color: Colors.white),))),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: Image.asset("assets/images/search.png", height: 20,)
      ),
    ],
  );
}
