import 'package:dro_app/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CommonUtils{
static   modalBottomSheetMenu({BuildContext context, Widget body, }){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
        ),
        context: context,
        builder: (builder){
          return new Container(
            height: 300.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color:Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: body
            ),
          );
        }
    );
  }

 static Widget checkMArk() {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      curve: Curves.elasticInOut,
      tween: Tween<double>(begin: 5, end: 25),
      builder: (__, value, child) {
        return Container(
            child: Icon(Icons.done,

                color: Color(0XFF009845)
            )
        );
      },
    );
  }


 static  Widget checkCancel() {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      curve: Curves.elasticInOut,
      tween: Tween<double>(begin: 5, end: 25),
      builder: (__, value, child) {
        return Container(
            child: Icon(Icons.cancel,

                color: Colors.red
            )
        );
      },
    );
  }







  static  showSuccessDialog({text, context,  VoidCallback onClose, String buttonText }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "images/yes.svg",
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Success!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(color: blue, fontSize: 15),
                  ),
                  SizedBox(height: 20),

                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: RaisedButton(
                      onPressed: onClose,
                      child: Text(
                        buttonText  ?? "okay",
                        style:TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      color: blue,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }






  static   showMsg({body,  context, scaffoldKey, Color snackColor} ) {
    final snackBar = SnackBar(
      backgroundColor:  snackColor,
      content: Text(body, style: TextStyle(fontSize: 12),),
      action: SnackBarAction(
        textColor: Colors.white,
        label: "Close",
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}